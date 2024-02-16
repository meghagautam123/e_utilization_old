import 'dart:convert';
import 'package:e_utilization/model/LoginResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class SendPost extends StatefulWidget
{
  @override
  _SendPostState createState() => _SendPostState();

}


class _SendPostState extends State<SendPost>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Map<String, String> arguments = {
      'username': 'Meenakshi',
      'password': '1234',
    };

    // Send the POST request
    sendPostRequest(arguments);

   /*Fluttertoast.showToast(
        msg: 'You cannot add more than 2 images'+response.statusCode.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
*/


    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request Example'),
      ),
      body: Center(
        child: Text('Sending POST request...'),
      ),
    );
  }


  Future<void> sendPostRequest(Map<String, String> arguments) async
  {
    final String url = 'http://192.168.43.22/EUtilization/login.php'; // Replace with your API endpoint

    try {
        final   response = await http.post(
        Uri.parse(url),
        body: arguments,

      );
     print("Login response"+response.body);
  /*   if(response.body.co)
       {

       }*/

  /*  final response = await retry(
         () => http.post(Uri.parse(url), body: arguments),
     maxAttempts: 3, // Adjust the number of retry attempts as needed
     delayFactor: Duration(seconds: 1),
    );*/

    /*response.statusCode;
      print('Response data: ${response.statusCode}');*/

      /*
      Fluttertoast.showToast(
          msg: 'You cannot add more than 2 images'+response.statusCode.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );*/

    /*  if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        // Handle the response data here
      }
      else {
        print('POST request failed with status: ${response.statusCode}');
      }*/
    //  if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

      var p = LoginModel.fromJson(jsonDecode(response.body));


       if(p.status.toString()=="true")
         {
           Fluttertoast.showToast(
               msg: 'true',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.red,
               textColor: Colors.yellow
           );
           print("true");
         }
          else
           {
             Fluttertoast.showToast(
                 msg: 'false',
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 1,
                 backgroundColor: Colors.red,
                 textColor: Colors.yellow
             );
             print("false");
           }

      //} else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        //throw Exception('Failed to load album');
      //}





    } catch (e) {
      print('Error sending POST request: $e');
    }
  }
}




















