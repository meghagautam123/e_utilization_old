import 'package:e_utilization/model/SearchSanctionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'e_uc_form_camera.dart';

class EForm extends StatefulWidget {
  Data? userData;
  String? username;
  String? token;

  EForm(Data userData, String username, String token) {
    this.userData = userData;
    this.username = username;
    this.token = token;
  }

  @override
  State<EForm> createState() => _EFormState();
}

class _EFormState extends State<EForm> {
  TextEditingController _allocatingTextController = TextEditingController();
  TextEditingController _schemeTextController = TextEditingController();
  TextEditingController _fyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _textFormFieldHeight = 30;

  //UserData? userdatan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_textEditingController.text = "jkhkjhkj";
    //_allocatingTextController.addListener(_clearForm);
    print(widget.userData!.schemeCode.toString());
    print("statecode"+widget.userData!.state_code.toString());
    //'${widget.userData.schemeName}'
    _allocatingTextController.text =
        widget.userData!.allocatingMinistry.toString();
    _schemeTextController.text = widget.userData!.schemeName.toString();
    _fyController.text = widget.userData!.finYear.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData( color: Colors. white),
          title: Center(
              child: Text(
            "E-UC Form",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'RobotoBold',
                fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.red.withOpacity(0.8)),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /*Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              "E UC Form ",
              style: TextStyle(
                  color: Colors.brown, fontFamily: 'RobotoBold', fontSize: 20),
            ),
          ),*/

          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Text(
                    "Allocating Ministry",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      // const EdgeInsets.fromLTRB(10.0, 0.0, 80.0, 0.0),
                      const EdgeInsets.fromLTRB(10.0, 0.0, 80.0, 0.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 60, minHeight: 40),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Allocating Ministry';
                        }
                        return null;
                      },
                      controller: _allocatingTextController,
                      decoration: InputDecoration(
                        /*    constraints: const BoxConstraints(maxHeight: 45, minHeight: 30),
                            isDense: true,*/
                        //  contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 10),

                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        /* contentPadding:
                         //EdgeInsets.fromLTRB(10, 0, 0, 0),
                          EdgeInsets.symmetric(vertical: 30.0),*/

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide(color: Colors.red)),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide:
                              BorderSide(color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 10.0),
                  child: Text(
                    "Scheme Name",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 80.0, 0.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 60, minHeight: 40),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Scheme';
                        }
                        return null;
                      },
                      controller: _schemeTextController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide:
                              BorderSide(color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 10.0),
                  child: Text(
                    "FY",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 80.0, 0.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 60, minHeight: 40),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter FY';
                        }
                        return null;
                      },
                      controller: _fyController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                        /*   border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide(
                              color: Colors.red), //<-- SEE HERE
                        ),
                    */
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide:
                              BorderSide(color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),

                          backgroundColor: Colors.red.withOpacity(0.8),
                          // padding: EdgeInsets.only(
                          //     left: 120, right: 120, top: 20, bottom: 20),
                        ),
                        onPressed: () {
                          //_validateInputs();
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EFormCamera(widget.userData!,widget.username,widget.token)));
                          }
                          else {}
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

/*  void _validateInputs() {
    if(_allocatingTextController.text.isNotEmpty )

  }*/

  void _clearForm() {}
}
