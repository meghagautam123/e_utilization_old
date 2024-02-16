import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/SearchSanctionModel.dart';

class MyHomePageSecond extends StatefulWidget {
  @override
  State<MyHomePageSecond> createState() => _MyHomePageSecondState();
}

class _MyHomePageSecondState extends State<MyHomePageSecond> {
  late Future<List<Data>?> _future;
  Data? _selectedUser;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _future = _getUsers("nr1023", "654a0915022fd3678921", "sanction");
  }

  Future<List<Data>?> _getUsers(String username, String token,
      String sanction) async {
  /*  final response =
        await http.get(Uri.parse('http://3.93.237.74/pfms/fetch.php'));
*/
    final Map<String, dynamic> requestBody = {
      'username': username,
      'token': token,
      'filter': sanction
    };
    final String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse('http://3.93.237.74/pfms/fetch.php'),
      body: jsonBody,
    );


    Map<String, dynamic> json = jsonDecode(response.body);




    final usersResponse = SearchSanctionModel.fromJson(json);
    return usersResponse.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Dropdown'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      body: Center(
        child: FutureBuilder<List<Data>?>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              }

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Select user:',
                    ),
                    if (_currentIndex == 0)
                      SizedBox(
                        height: 64,
                        child: DropdownButton<Data>(
                          /*  onChanged: (user) =>
                              setState(() =>
                              _selectedUser = user),*/

                          onChanged: (user) {
                            print(user!.schemeName.toString());
                            setState(() {
                              _selectedUser = user;
                            });
                          },
                          value: _selectedUser,
                          items: [
                            ...snapshot.data!.map(
                              (user) => DropdownMenuItem(
                                value: user,
                                child: Row(
                                  children: [
                                   // Image.network(user.avatar),
                                    Text('${user.schemeName} '),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                  ],
                ),
              );
            }),






      ),
    );
  }
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        avatar = json['avatar'];
}

class UsersResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  const UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  UsersResponse.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        perPage = json['per_page'],
        total = json['total'],
        totalPages = json['total_pages'],
        data = (json['data'] as List<dynamic>)
            .map((json) => User.fromJson(json))
            .toList();
}
