import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
class ApiDropDown extends StatefulWidget{

  @override
  State<ApiDropDown> createState() => _ApiDropDownState();



}
class _ApiDropDownState extends State<ApiDropDown> {
  List categoryItemlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }
  Future getAllCategory() async {
    var baseUrl = "https://gssskhokhar.com/api/classes/";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: const Text("DropDown List"),
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    DropdownButton(
    hint: Text('Select Class'),
    items: categoryItemlist.map((item) {
    return DropdownMenuItem(
    value: item['ClassCode'].toString(),
    child: Text(item['ClassName'].toString()),
    );
    }).toList(),
    onChanged: (newVal) {
    setState(() {
    /*dropdownvalue = newVal;
    getSubjects(dropdownvalue);*/
    });
    },
   //  value: dropdownvalue,
    )
    ])));
  }
}
