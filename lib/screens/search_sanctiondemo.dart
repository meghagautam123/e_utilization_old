import 'dart:core';
import 'package:e_utilization/model/LoginResponseModel.dart';
import 'package:e_utilization/model/SearchSanctionModel.dart';
import 'package:e_utilization/screens/e_uc_form.dart';
import 'package:e_utilization/screens/scheme_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/UserData.dart';
import 'package:http/http.dart' as http;
import 'MyProfile.dart';

class SearchSanctionDemo extends StatefulWidget {
  String? username;

  //UserData? datanew;
  String? token;

  SearchSanctionDemo(String? username, String? token) {
    // this.datanew=datanew;
    this.username = username;
    this.token = token;
  }

  @override
  State<SearchSanctionDemo> createState() => _SearchSanctionDemoState();
}

class _SearchSanctionDemoState extends State<SearchSanctionDemo> {
  Data? _selectedUser;
  late Future<List<Data>?> _future;
  String? dropdownvalue;
  Data? data, datedata;
  UserData? datanew;
  String? sanctiondropdownvalue;
  DateTimeRange? _selectedDateRange;
  var token;
  var userid;
  var username;
  var items = [
    'By Sanction',
    'By Date',
    'By Scheme',
  ];
  String defaultValue = "";
  final _textEditingController = TextEditingController();
  TextEditingController _schemeEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();

  var sanctionitems = [
    'Sanction1',
    'Sanction2',
    'Sanction3',
    'Sanction4',
    'Sanction5'
  ];

  GlobalKey<FormFieldState> newKey = GlobalKey<FormFieldState>();

  final List<String> items1 = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? state_code,
      dist_code,
      schemeName,
      allocatingMinistry,
      finYear,
      unspentBal,
      status,
      dateOfGen,
      schemeCode,
      lastDate,
      eucId;
  String? allocate;
  String? stat;
  String? selectedValue;
  bool _isSanctionShow = false;
  bool _isScheme = false;
  bool isSelected = false;
  bool _value = false;
  bool btnSearch = false;
  bool _isDate = false;
  bool _isAmount = false;
  List categoryItemlist = [];
  late Future<String?> name;
  late Future<String> listnew;
  String? userName;
  String userNews = "";
  String? _patientPhone; //String resultnew="";
  //String var1;
  late final String var1;
  String? userNameSanction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*Future.delayed(Duration.zero, () async {
      var1 = await getName();
      //here is the async code, you can execute any async code here

      String var2 = await getList();

      print("543" + var1!);
      print("654" + var2);
    });
    */

/*
    getName().then((value)
   {
   setState(()
   {
  userNameSanction = value;

   });
*/

//}

//);

    print("widgetusername" + widget.username.toString());

    print("widgettoken" + widget.token.toString());

    _future = _getSanctionList(widget.username!, widget.token!, "sanction");
  }

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
  }

  Future<List<Data>?> getDateApi(String username, String token, String filter,
      String fDate, String tDate) async {
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

    for (var item in list!) {
      //userid = item.userid;
      schemeName = item.schemeName;
      allocate = item.allocatingMinistry;
      finYear = item.finYear;
      unspentBal = item.unspentBalance;
      stat = item.status;
      dateOfGen = item.dateOfGen;
      schemeCode = item.schemeCode;
      lastDate = item.lastDate;
      eucId = item.eucId;
      state_code = item.state_code;
      dist_code = item.dist_code;

      //  print("usernameval"+username!);
    }

    print("schemeval5689" + schemeName!);

    datedata = Data(
        schemeName: schemeName,
        allocatingMinistry: allocate,
        finYear: finYear,
        unspentBalance: unspentBal,
        status: stat,
        dateOfGen: dateOfGen,
        schemeCode: schemeCode,
        lastDate: lastDate,
        eucId: eucId,
        state_code: state_code,
        dist_code: dist_code);
    return usersResponse.data!;
  }

  /* Future getAllCategory(String username, String token, String sanction) async {
    var baseUrl = "http://3.93.237.74/pfms/fetch.php";

    //  http.Response response = await http.get(Uri.parse(baseUrl));

    final Map<String, dynamic> requestBody = {
      'username': username,
      'token': token,
      'filter': sanction
    };
    final String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonBody,
    );

       print("response"+response.toString());
      var jsonData = jsonDecode(response.body);
      final usersResponse = SearchSanctionModel.fromJson(jsonData);
      print("userresp"+usersResponse.data.toString());

      setState(() {
      //  categoryItemlist = usersResponse.data!;
      categoryItemlist.add(usersResponse.data);

      });
      print("categoryitemlist"+categoryItemlist.toString());
  }
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData( color: Colors. white),
            centerTitle: true,
            title: Text(
              "Search Sanction Details",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
            //  ),
            backgroundColor: Colors.red.withOpacity(0.8),
            actions: [
              IconButton(
                  icon: const Icon(Icons.account_circle),
                  color: Colors.white,
                  onPressed: () {
                    navigateToProfile();
                  })
            ]),

        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  Center(
                      child: Container(
                    width: 230,
                    height: 40,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Colors.red.withOpacity(0.8),
                          style: BorderStyle.solid,
                          width: 2.00),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isDense: true,
                        isExpanded: true,
                        focusColor: Colors.transparent,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        hint: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Search by Category',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item), // Your item text
                                  Divider(  // Add a line beneath each item
                                    color: Colors.black,
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            ),


                                  /*child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),*/

                                 /*child: Container(
                                    decoration: BoxDecoration(*/

                                      /*border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                   ),*/

                                     /* border: selectedValue == item
                                          ? null
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                    ),*/

                                    //padding: EdgeInsets.symmetric(vertical: 8.0),

                                   /* child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),*/

                               //),//Container
                                ),
                        )

                            .toList(),

                        /*  items: [
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
                  ],*/

                        value: dropdownvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            //    value: dropdownvalue;
                            dropdownvalue = newValue!;

                            // _value = newValue;
                            if (dropdownvalue == "By Sanction")
                            {
                              setState(() {
                                _isSanctionShow = true;
                                _isDate = false;
                                _isScheme = false;
                                _isAmount = false;
                                /* if (_selectedUser != null) {
                                        btnSearch = true;
                                      }*/
                              });
                            }
                            else if (dropdownvalue == "By Scheme")
                            {
                              setState(() {
                                _isSanctionShow = false;
                                _isScheme = true;
                                _isDate = false;
                                btnSearch = false;
                                _isAmount = false;
                              });
                            }

                            /*else if (dropdownvalue == "By Amount") {
                              setState(() {
                                _isSanctionShow = false;
                                _isScheme = false;
                                _isDate = false;
                                btnSearch = false;
                                _isAmount = true;
                              });
                            }*/

                            else if (dropdownvalue == "By Date")
                            {
                              setState(() {
                                _isSanctionShow = false;
                                _isScheme = false;
                                _isAmount = false;
                                _isDate = true;
                                //btnSearch=true;
                                dateShow();
                              });
                            }
                          });
                        },
                      ),
                    ),
                  )),

                  //Load Sanction Data From Api
                  Visibility(
                    visible: _isSanctionShow,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                      child: Center(
                        child: Container(
                            width: 230,
                            height: 40,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Colors.red.withOpacity(0.8),
                                  style: BorderStyle.solid,
                                  width: 2.00),
                            ),

                            /*child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Select Sanction',
                                    style: TextStyle(
                                        fontSize: 14,
                                        // color: Theme.of(context).hintColor,
                                        color: Colors.black87),
                                  )),
                                items: categoryItemlist.map((item) {
                                return DropdownMenuItem(

                                // value: item['scheme_name'].toString(),
                                  child: Text(item.toString()),
                                );
                              }).toList(),
                                onChanged: (newVal)
                                {
                                setState(() {
                                  dropdownvalue = newVal;
                                });
                              },
                                value: dropdownvalue,
                              ),),
                           */

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
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 0.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<Data>(
                                        focusColor: Colors.transparent,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        hint: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Select Sanction',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  // color: Theme.of(context).hintColor,
                                                  color: Colors.black87),
                                            )),
                                        onChanged: (user) {
                                          print(user!.schemeName.toString());
                                          print("statecodesanction" +
                                              user!.state_code.toString());

                                          //    sanctiondropdownvalue = user!.schemeName.toString();
                                          //    Data data =Data(user!.schemeName, user!.allocatingMinistry,user!.finYear,"jgj","ghgj","hjh","hfhgf","hfhfh","jgjhg", schemeName: '')
                                          data = Data(
                                              schemeName: user!.schemeName,
                                              allocatingMinistry:
                                                  user!.allocatingMinistry,
                                              finYear: user!.finYear,
                                              unspentBalance:
                                                  user!.unspentBalance,
                                              status: user!.status,
                                              dateOfGen: user!.dateOfGen,
                                              schemeCode: user!.schemeCode,
                                              lastDate: user!.lastDate,
                                              eucId: user!.eucId,
                                              state_code: user!.state_code,
                                              dist_code: user!.dist_code);

                                          datanew = UserData(
                                              name: "gjhgjh", age: "hgjhg");

                                          if (user!.schemeName.toString() !=
                                              null) {
                                            btnSearch = true;
                                          }

                                          setState(() {
                                            _selectedUser = user;
                                            //       sanctiondropdownvalue=_selectedUser!.schemeName.toString();
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

                                    // ],

                                    //   ),
                                  );
                                })),
                      ),
                    ),
                  ),

                  Visibility(
                      visible: _isScheme,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(48.0, 20.0, 48.0, 0.0),
                        child: SizedBox(
                          height: 35,
                          child: GestureDetector(
                            //  onTap: (){ _focusNode.unfocus();},
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  if (_schemeEditingController.text
                                      .toString()
                                      .isNotEmpty) {
                                    btnSearch = true;
                                  } else {
                                    btnSearch = false;
                                  }
                                });
                              },

                              controller: _schemeEditingController,
                              //     focusNode: _focusNode,
                              decoration: InputDecoration(
                                //  hintText: "Enter Scheme",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: BorderSide(
                                      color: Colors.red), //<-- SEE HERE
                                ),
                              ),
                              // ),
                            ),
                          ),
                        ),
                      )),

                  Visibility(
                      visible: _isDate,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(48.0, 20.0, 48.0, 0.0),
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            //  onTap: (){ _focusNode.unfocus();},
                            child: TextField(
                              controller: _textEditingController,
                              //     focusNode: _focusNode,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: BorderSide(
                                      color: Colors.red), //<-- SEE HERE
                                ),
                              ),
                              // ),
                            ),
                          ),
                        ),
                      )),

                  Visibility(
                      visible: _isAmount,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(48.0, 20.0, 48.0, 0.0),
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            //  onTap: (){ _focusNode.unfocus();},
                            child: TextField(
                              controller: _amountEditingController,
                              //     focusNode: _focusNode,

                              onChanged: (text) {
                                setState(() {
                                  if (_amountEditingController.text
                                      .toString()
                                      .isNotEmpty) {
                                    btnSearch = true;
                                  } else {
                                    btnSearch = false;
                                  }
                                });
                              },

                              decoration: InputDecoration(
                                hintText: "Enter Amount",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: BorderSide(
                                      color: Colors.red), //<-- SEE HERE
                                ),
                              ),
                              // ),
                            ),
                          ),
                        ),
                      )),

                  SizedBox(
                    height: 30,
                  ),

                  Visibility(
                    visible: btnSearch,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Colors.red.withOpacity(0.8),
                          // padding: EdgeInsets.only(
                          //     left: 120, right: 120, top: 20, bottom: 20),
                        ),
                        onPressed: () {
                          if (dropdownvalue == "By Sanction") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EForm(data!,
                                        widget.username!, widget.token!)));
                          }

                          if (dropdownvalue == "By Date") {
                            //getDateApi();

                            /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EForm(datedata!,widget.username!,widget.token!)));

*/

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SchemeDetail(
                                        widget.username!,
                                        widget.token!,
                                        "date",
                                        _textEditingController.text
                                            .toString())));
                          }

                          /*    if(dropdownvalue=="By Amount")
                          {
                            //getDateApi();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EForm(datedata!,widget.username!,widget.token!)));

                          }*/

                          if (dropdownvalue == "By Scheme") {
                            //getDateApi();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SchemeDetail(
                                        widget.username!,
                                        widget.token!,
                                        "scheme_name",
                                        _schemeEditingController.text
                                            .toString())));
                          }
                        },
                        child: const Text(
                          'Search',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ])));
  }

  void dateShow() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );
//print(currentDa)
    if (result != null) {
      //Rebuild the UI

      print("datetime" + DateTime.now().toString());
      print(result.start.toString());
      print("hours" + result.duration.inHours.toString());
      print("minutes" + result.duration.inMinutes.toString());
      print("seconds" + result.duration.inSeconds.toString());

      var parsedDate = DateTime.parse(result.start.toString());
      print("parseddate" + parsedDate.toString());
      String convertedDate = new DateFormat("yyyy-MM-dd").format(parsedDate);
      print("converteddate" + convertedDate);
      var parsedEndDate = DateTime.parse(result.end.toString());
      String convertedEndDate =
          new DateFormat("yyyy-MM-dd").format(parsedEndDate);

      setState(() {
        _selectedDateRange = result;
        _textEditingController.text = convertedDate + " - " + convertedEndDate;
        btnSearch = true;
      });

      String converthrdate = convertedDate + " " + "00:00:00";
      String endhrdate = convertedEndDate + " " + "00:00:00";

      print("converthrdate" + converthrdate);
      print("endhrdate" + endhrdate);

      Future<List<Data>?> j = getDateApi(
          widget.username!, widget.token!, "date", converthrdate, endhrdate);
    }
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    // await Future.delayed(Duration(seconds: 2)); // Simulating a delay of 2 seconds

    String? stringValue = prefs.getString('saveName');
    //String? result = await stringValue;
    print("stringvalues" + stringValue!);
    // setState(() => _patientPhone = stringValue);
    return stringValue;

    Fluttertoast.showToast(
        msg: 'Name Saved Successfully' + stringValue!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  Future<void> sendRequest(String username, String token, String filter) async {
    // Replace with your API endpoint

    print("username" + username);
    print("token" + token);

    final String url =
        'http://3.93.237.74/pfms/fetch.php'; // Replace with your API endpoint

    try {
      final Map<String, dynamic> requestBody = {
        'username': username,
        'token': token,
        'filter': filter
      };

      final String jsonBody = jsonEncode(requestBody);
      final response = await http.post(
        Uri.parse(url),
        body: jsonBody,
      );

      //  var jsonData = json.decode(response.body) as List;

      /*  SearchSanctionModel dataModel = SearchSanctionModel.fromJson(response.body );
dataModel.data*/

      Map<String, dynamic> json = jsonDecode(response.body);
      final usersResponse = SearchSanctionModel.fromJson(json);

      print(usersResponse);
      List<Data>? data = usersResponse.data;
      //postSpinnerData(Data.fromJson(json));
      print(data);
      print("fde" + Data.fromJson(json).toString());

      /*for (var element in jsonData)
      {
        items.add(element["ClassName"]);
      }
*/
      print("sanction response" + response.body);
    } catch (e) {
      print('Error sending POST request: $e');
    }
  }

/* List<Data> postSpinnerData(Data data)
  {

}*/

  Future<String> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('sampleList');

    var sampleJsonMap = json.decode(stringValue!);

    var user = LoginModel.fromJson(sampleJsonMap);
    token = user.token;
    List<Datum> list = user.data;

    for (var item in list) {
      userid = item.userid;
      username = item.username;

      print(userid);
    }
    print(user.token);
    return user.token;
    //sendRequest(username, token, "sanction");

    /*  List<LoginModel> sampleListFromPreferance = List<LoginModel>.from(sampleJsonMap.map((x) => LoginModel.fromJson(x)));

// print the final output
    print(sampleListFromPreferance);*/

    /*  print(sampleJsonMap);
sampleJsonMap.*/
    /*  if (stringValue != null) {
      // Convert the JSON string back to a list
      List<String> myList = stringValue.split(', ');
     //myList.
      // Now you have your list of items
      print(myList.length);

    } else {
      print('List not found in SharedPreferences.');
    }
*/

    // return stringValue;

/*    Fluttertoast.showToast(
        msg: 'Name '+stringValue!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );*/
  }

  void navigateToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyProfile()));
  }
}
