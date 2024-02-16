import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/LoginResponseModel.dart';

class MyProfile extends StatefulWidget
{
  @override
  State<MyProfile> createState() => _ProfileState();
}

 class _ProfileState extends State<MyProfile>
 {
  //String?  userid ;
  late  String email,mobile,userid,usernamenew,firstname,lastname,username;
  late String  useridnew,firstnamenew,lastnamenew,mobilenew,emailnew;


  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    //_textEditingController.text = "jkhkjhkj";
    //_allocatingTextController.addListener(_clearForm);
   //getData();
//    WidgetsBinding.instance?.addPostFrameCallback((_) {
     getData();
   //});

  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sampleDataFromPref = prefs.getString("dataList");
    //convert string data to jsonMap
    var sampleJsonMap = json.decode(sampleDataFromPref!);
    //convert json map list to object model lis
    List<Datum> sampleListFromPreferance =
    List<Datum>.from(sampleJsonMap.map((x) => Datum.fromJson(x)));
    //print the final output
    print("dataList2" + sampleListFromPreferance.toString());

    for (var item in sampleListFromPreferance)
    {
      username = item.username;
      userid = item.userid;
      firstname = item.firstname;
      lastname = item.lastname;
      email = item.email;
      mobile = item.mobile;
    }

    setState(() {
      usernamenew = username ;
      useridnew = userid;
      firstnamenew = firstname;
      lastnamenew = lastname;
      emailnew = email;
      mobilenew = mobile;

    });
    //print("usernamenew" + usernamenew);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData( color: Colors. white),
          centerTitle: true,
            //title: Center(
               title: Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
        //),
            backgroundColor: Colors.red.withOpacity(0.8)),

        /*body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),

                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "User Name:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                      child: Text(usernamenew),
                    )
                  ],
                ),


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "User Id:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                      child: Text(useridnew),
                    )
                  ],
                ),



                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "First Name:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                      child: Text(firstnamenew),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Last Name:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(lastnamenew),
                    )
                  ],
                ),


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Email:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(emailnew),
                    )
                  ],
                ),


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Mobile:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(mobilenew),
                    )
                  ],
                ),


             ]),
        )*/

      body: Container(
        child: Column(
          children: <Widget>[

            ListTile(
              title: Text(
                'Username',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                usernamenew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),

            Divider(height: 1,),

            ListTile(
              title: Text(
                'User Id',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                useridnew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),

            Divider(height: 1,),

            ListTile(
              title: Text(
                'First Name',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                firstnamenew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),

            Divider(height: 1,),
            ListTile(
              title: Text(
                'Last Name',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                lastnamenew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),

            Divider(height: 1,),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                emailnew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),

            Divider(height: 1,),
            ListTile(
              title: Text(
                'Mobile',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                mobilenew,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(
                  0.0, 0.0, 0.0, 20.0),
              child: SizedBox(
                width: 200,
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
                   // _validateInputs();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 19, color: Colors.white),
                  ),
                ),


              ),
            ),



          ],
        ),
      )
        ,




    );
  }


}
