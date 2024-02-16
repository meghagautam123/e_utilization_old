import 'dart:convert';
import 'dart:io';
import 'package:e_utilization/screens/MyHomePageSecond.dart';
import 'package:e_utilization/screens/search_sanction.dart';
import 'package:e_utilization/screens/search_sanctiondemo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/LoginResponseModel.dart';
/*https://medium.flutterdevs.com/using-sharedpreferences-in-flutter-251755f07127*/
import 'package:device_info/device_info.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}


class _LoginState extends State<LoginScreen>
{
  bool _isLoading=false;
  LoginModel? _model;
  bool passwordVisible = false;
  TextEditingController userInput = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _passwordVal;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iosInfo;
 String? token;
 String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
    _getDeviceInfo(); 

  }


  @override
  void dispose() {
    // TODO: implement dispose
    userInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    /*Map<String, String> arguments = {
      'username': 'Meenakshi',
      'password': '1234',
    };*/
   //sendPostRequest(arguments);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /*Lottie.network(
                      // 'https://assets6.lottiefiles.com/private_files/lf30_ulp9xiqw.json', //shakeing lock
                      'https://assets6.lottiefiles.com/packages/lf20_k9wsvzgd.json',
                      animate: true,
                      height: 120,
                      width: 600),*/
                  // logo here
                  // Image.asset(
                  //   'assets/images/logo_new.png',
                  //   height: 120,
                  //   width: 120,
                  // ),

                  const Text(
                    'Login',
                    style: TextStyle(
                    fontFamily: "RobotoBold",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  /*Text(
                    'Please login to continue using our app',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w300,
                        // height: 1.5,
                        fontSize: 15),
                  ),*/

                  const SizedBox(
                    height: 30,
                  ),
                  /*SingleChildScrollView(
                    child:*/
                  Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          //   color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),

                      child: Form(
                        key: _formKey,

                        autovalidateMode: _autoValidate,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 0, top: 20),
                              child:

                                  TextFormField(
                                controller: userInput,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.withOpacity(0.8),
                                          width: 1.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.withOpacity(0.8),
                                          width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.red.withOpacity(0.8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "User Name",
                                  hintText: 'Enter User Name',
                                  labelStyle: TextStyle(
                                      color: Colors.red.withOpacity(0.8)),
                                ),
                                validator: (String? arg) {
                                  /* if(arg!.isNotEmpty) {*/
                                  if (arg!.length < 5 && arg.length > 1) {
                                    return 'Name must be more than 5 character';
                                  }

                                  //  }
                                  else if (arg.isEmpty) {
                                    return 'Please enter User name';
                                  } else {
                                    return null;
                                  }
                                },

                                onSaved: (String? val) async
                                {
                                  _name = val;

                                 /*SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('stringValue', "abc");*/
                                  saveNameSharedPref(_name);

                                },
                              ),
                            ),

                            //For Password
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: TextFormField(
                                obscureText: passwordVisible,
                                controller: userPassword,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red.withOpacity(0.8),
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red.withOpacity(0.8),
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.red.withOpacity(0.8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Password",
                                    hintText: 'Enter Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    labelStyle: TextStyle(
                                        color: Colors.red.withOpacity(0.8))),
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'Please enter password';
                                  }

                                  return null;
                                },
                                onSaved: (String? val) {
                                  _passwordVal = val;
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 3,
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: SizedBox(
                                width: 250,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(60.0)),
                                    backgroundColor:
                                        Colors.red.withOpacity(0.8),
                                      /*padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width /
                                                  3.3,
                                          vertical: 20)*/
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 12, bottom: 12),
                                  ),
                                  onPressed: () {
                                    //}
                                    _validateInputs();
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),


                              ),
                            ),
                            Visibility(visible: _isLoading, child: CircularProgressIndicator())
                         ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),


      //For Footer
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          height: 110.0,
          color: Colors.grey[200],
          child: Column(
            children: [
              Image.asset('assets/images/nrsclogo.png', width: 40, height: 40),
              SizedBox(height: 10),
              Text(
                "Designed By RRSC North,NRSC,ISRO",
                style: TextStyle(fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
              )
            ],
          )),
    );
  }

  void _validateInputs() {

    if (_formKey.currentState!.validate())
    {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();
       /*Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchSanctionDemo()));*/

      Map<String, String> arguments = {
        'username': userInput.text.toString(),
        'password': userPassword.text.toString(),
      };

      setState(() {
        _isLoading = true;

      });

      sendPostRequest(arguments);

       //async{
       /* setState(() {
          _isLoading=true;

        });

     setState(() {
          _isLoading=false;
        });*/
    }
    else
    {
      //If all data are not valid then start auto validation.

      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
    }



  }


  Future<void> sendPostRequest(Map<String, String> arguments) async
  {
    final String url = 'http://3.93.237.74/pfms/login.php'; // Replace with your API endpoint
    final String jsonBody = jsonEncode(arguments);

    try {
      final   response = await http.post(
        Uri.parse(url),
        body: jsonBody,
      );
      print("Login response"+response.body);


   _model = loginFromJson(response.body);

      String status=_model!.status;

      setState(() {
       // data = resp['slip']['advice'];
        _isLoading = false;
      });

    if(status == "Success")
   {
    print("Hello"+_model.toString());
    print("Login response2"+ _model!.data.toString());
    token = _model!.token;
    print("tokenval"+token.toString());

    List<Datum> list = _model!.data;
    String dataList = jsonEncode(list);
    print("dataList"+dataList);


    for (var item in list)
    {
      username = item.username;
      print("usernameval"+username!);
    }

    String sampleStringList = jsonEncode(_model);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sampleList', sampleStringList);
    //prefs.setStringList("liststring", list.toString() as List<String>);
    //prefs.setString(key, value);
    prefs.setString("dataList",dataList );
    print("dataList1"+sampleStringList);



  /*   String? sampleDataFromPref = prefs.getString("dataList");
     //convert string data to jsonMap
     var sampleJsonMap = json.decode(sampleDataFromPref!);
     //convert json map list to object model lis
     List<Datum> sampleListFromPreferance = List<Datum>.from(sampleJsonMap.map((x) => Datum.fromJson(x)));
     //print the final output
     print("dataList2"+sampleListFromPreferance.toString());

         for(var item in sampleListFromPreferance)
           {
           String u=item.username;
           String userid=item.userid;
           print("username23"+u);
           print("userid23"+userid);

           }


*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchSanctionDemo(username,token)));
  }

    else if(status=="Failed")
      {
        setState(() {
          _isLoading = false;

        });
        Fluttertoast.showToast(
            msg: 'Invalid username or password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow
        );


      }


   } catch (e) {
      setState(() {
        _isLoading = false;

      });
      print('Error sending POST request: $e');
      Fluttertoast.showToast(
          msg: 'Invalid username or password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );

    }
  }

  Future<void> saveNameSharedPref(String? name)  async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('saveName', name!);


   /* Fluttertoast.showToast(
        msg: 'Name Saved Success'+name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
*/

  }

  Future<void> _getDeviceInfo() async{

    if (Platform.isAndroid) {
      androidInfo = await DeviceInfoPlugin().androidInfo;
      print('Device Model: ${androidInfo.model}');
      print('Device Manufacturer: ${androidInfo.manufacturer}');
      print('Device ID: ${androidInfo.androidId}');


    }
    else if (Platform.isIOS) {
      iosInfo = await DeviceInfoPlugin().iosInfo;
      print('Device Model: ${iosInfo.utsname.machine}');
      print('Device Manufacturer: Apple');
      // Unique identifier for iOS devices may vary.
    }

  }
}
