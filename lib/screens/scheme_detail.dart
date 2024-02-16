import 'dart:convert';
import 'package:e_utilization/screens/e_uc_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/SearchSanctionModel.dart';


class SchemeDetail extends StatefulWidget {
  String? username;
  String? token;
  String? filter;
  String? schemetext;
  Data? data;

  SchemeDetail(String username, String token, String filter,
      String schemetext) {

    this.username = username;
    this.token = token;
    this.filter = filter;
    this.schemetext = schemetext;

  }


  State<SchemeDetail> createState() => _SchemeDetailState();

}

class _SchemeDetailState extends State<SchemeDetail> {
  Future<List<Data>?>? postsFuture;
  String? schemeName,allocatingMinistry,finYear,unspentBal,status,dateOfGen,schemeCode,lastDate,eucId,state_code,dist_code;
  String? allocate;
  String? stat;
  Data? datedata;
/*Future<List<Post>> postsFuture = _getSanctionList(username, token, sanction);
  Future<List<Data>?> _getSanctionList(
      String username, String token, String sanction) async {
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

  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("userdetail" + widget.username!);
    print("tokendetail" + widget.token!);
    print("filterdetail" + widget.filter!);
    print("schemedetail" + widget.schemetext!);
    String? schename = widget.schemetext;
    print("schemedetailtv"+schename!);

    String? fDate =   schename?.substring(0,10);
    String? tDate = schename?.substring(12,23);

    print("schemefDate"+fDate!);
    print("schemeToDate"+tDate!);

     String fromDate= fDate+" " +"00:00:00";
     String toDate=tDate+" " +"00:00:00";


    if(widget.filter == "date")
    {
     String? scheme231 = widget.schemetext;
     print("scheme231"+scheme231!);

      postsFuture=    getDateApi(
         widget.username!, widget.token!, "date",fromDate,toDate);

    }

else     if(widget.filter == "scheme_name")
      {
        postsFuture = getSchemeList(
            widget.username!, widget.token!, widget.filter!, widget.schemetext!);

       //print(postsFuture);

     }

  }





  Future<List<Data>?> getDateApi(
      String username, String token, String filter,String fDate,String tDate) async {

    final Map<String, dynamic> requestBody = {
      'username': username,
      'token': token,
      'filter': filter,
      'fDate': fDate,
      'tDate': tDate,

    };

    final String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse('http://3.93.237.74/pfms/fetch.php'),
      body: jsonBody,
    );

    Map<String, dynamic> json = jsonDecode(response.body);
    final usersResponse = SearchSanctionModel.fromJson(json);

    List<Data>? list = usersResponse.data;

    for (var item in list!)
    {
      //userid = item.userid;
      schemeName = item.schemeName;
      allocate   = item.allocatingMinistry;
      finYear = item.finYear;
      unspentBal   = item.unspentBalance;
      stat  = item.status;
      dateOfGen   = item.dateOfGen;
      schemeCode   = item.schemeCode;
      lastDate   = item.lastDate;
      eucId  = item.eucId;
      //  print("usernameval"+username!);
    }

    print("schemeval5689"+schemeName!);

    datedata = Data(
        schemeName: schemeName,
        allocatingMinistry:
        allocate,
        finYear: finYear,
        unspentBalance:
        unspentBal,
        status: stat,
        dateOfGen: dateOfGen,
        schemeCode: schemeCode,
        lastDate: lastDate,
        eucId: eucId,
        state_code: state_code,
      dist_code: dist_code


    );
    return usersResponse.data!;

  }


  Future<List<Data>?> getSchemeList(String username, String token,
      String sanction, String schemetext) async {
    final Map<String, dynamic> requestBody = {
      'username': username,
      'token': token,
      'filter': sanction,
      'scheme_name': schemetext
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
      appBar: AppBar(
          title: Center(
              child: Text(
                "Scheme Details",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              )),
          backgroundColor: Colors.red.withOpacity(0.8)),
      body: Center(
        // FutureBuilder
        child: FutureBuilder<List<Data>?>(
          future: postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
            {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            }
            else if (snapshot.hasData)
            {
              // once data is fetched, display it on screen (call buildPosts())
              final posts = snapshot.data!;
              return buildPosts(posts);
            }
            else
            {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildPosts(List<Data> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return new GestureDetector(
            onTap: () {
        Data?      data = Data(
                  schemeName: post.schemeName,
                  allocatingMinistry:
                  post.allocatingMinistry,
                  finYear: post.finYear,
                  unspentBalance:
                  post.unspentBalance,
                  status: post.status,
                  dateOfGen: post.dateOfGen,
                  schemeCode: post.schemeCode,
                  lastDate: post.lastDate,
                  eucId: post.eucId,
                  state_code: state_code,
          dist_code: dist_code


        );


              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EForm(data!, widget.username!, widget.token!)));
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
           color: Colors.grey.shade300,
              ),
            //  color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 70,
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text(post.schemeCode!)),
                  SizedBox(width: 10),
                  Expanded(flex: 3, child: Text(post.schemeName!)),
                ],

              ),
            ));
      },


    );
  }
}
