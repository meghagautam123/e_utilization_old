// https://github.com/beautybird/Flutter-with-Postgresql-using-Models-class/tree/master

import 'package:e_utilization/dismissKeyboard/DismissKeyboard.dart';
import 'package:e_utilization/screens/e_uc_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class SearchSanction extends StatefulWidget {
  @override
  State<SearchSanction> createState() => _SearchSanctionState();
}

class _SearchSanctionState extends State<SearchSanction> {
  final _focusNode = FocusNode();
 final _textEditingController = TextEditingController();
 DateTimeRange? _selectedDateRange;
  bool _visible = false;
  bool _amount_visible = false;
  bool _sanction_visible = false;
  bool _default_visible = true;
  TextEditingController dateinput = TextEditingController();
  String dropdownvalue = 'By Sanction';
  bool isVisible = false;



  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field

  /*  FocusScopeNode currentfocus = FocusScope.of(context); //get the currnet focus node
    if (!currentfocus.hasPrimaryFocus) { //prevent Flutter from throwing an exception
      currentfocus.unfocus(); //unfocust from current focust, so that keyboard will dismiss
    }*/

    super.initState();
  }

  // List of items in our dropdown menu
  var items = [
    'By Sanction',
    'By Date',
    'By Amount',
    'By Scheme',
  ];

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
  String? selectedValue;

//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return Scaffold(
//         appBar:AppBar(title: Center(child: Text("Search Sanction Details",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'RobotoBold',fontWeight: FontWeight.bold),)),backgroundColor: Colors.red.withOpacity(0.8)),
//
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//        /* Padding(
//           padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
//           child: Text(
//             "Search Sanction Details ",
//             style: TextStyle(
//                 color: Colors.brown, fontFamily: 'RobotoBold', fontSize: 20),
//           ),
//         ),*/
//         SizedBox(
//           height: 20,
//         ),
//
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
//           child: DropdownButtonFormField(
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   /* borderSide: BorderSide(
//                     color: Colors.amberAccent, width: 1),*/ //<-- SEE HERE
//                   borderRadius: BorderRadius.circular(10.0)),
//               focusedBorder: OutlineInputBorder(
//                   /*   borderSide: BorderSide(
//                     color: Colors.amberAccent, width: 1),*/ //<-- SEE HERE
//                   borderRadius: BorderRadius.circular(10.0)),
//               filled: true,
//               fillColor: Colors.redAccent.withOpacity(0.3),
//             ),
//
//             dropdownColor: Colors.greenAccent,
//             // Initial Value
//             value: dropdownvalue,
//
//             // Down Arrow Icon
//             icon: const Icon(Icons.keyboard_arrow_down),
//
//             // Array list of items
//             items: items.map((String items) {
//               return DropdownMenuItem(
//                 value: items,
//                 child: Text(items),
//               );
//             }).toList(),
//             // After selecting the desired option,it will
//             // change button value to selected value
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownvalue = newValue!;
//                 /*     if (dropdownvalue == "By Date") {
//
//                   isVisible = !isVisible;
//                 }
//                 else if (dropdownvalue == "By Sanction")
//                 {
//                   isVisible = false;
//                 }
//             */
//               });
//             },
//           ),
//         ),
//         SizedBox(height: 30),
//
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
//           child: TextField(
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1, color: Colors.black), //<-- SEE HERE
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1, color: Colors.black), //<-- SEE HERE
//               ),
//             ),
//           ),
//         ),
//
//         /*Visibility(visible: isVisible, child: Text("date new")),*/
//
//
//         //Button
//        /* Container(
//           height: 50.0,
//           child:*/
//
//         SizedBox(height: 40,),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(
//               0.0, 0.0, 0.0, 30.0),
//           child: Center(
//             child: SizedBox(width: 130,
//               height: 40,
//               child: ElevatedButton(
//
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//
//                         borderRadius:
//                         BorderRadius.circular(10.0)),
//
//                     backgroundColor: Colors.red.withOpacity(0.8),
//
//                  /*   padding: EdgeInsets.symmetric(
//                         horizontal:
//                         MediaQuery.of(context).size.width /
//                             3.3,
//                         vertical: 20)*/
//
//
//                   // padding: EdgeInsets.only(
//                   //     left: 120, right: 120, top: 20, bottom: 20),
//                 ),
//
//                 onPressed: () {
//                     Navigator.push(
//                                context,
//                                  MaterialPageRoute(
//                                        builder: (context) => EForm()));
//
//
//                   /*    if (_formKey.currentState!.validate()) {
//     ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//     backgroundColor: Colors.white,
//     content: Text(
//     'Validation Successful',
//     style: TextStyle(
//     color: Colors.black,
//     ),
//     ),
//     ),
//     );
// */
//                   //}
//
//                 },
//                 child: const Text(
//                   'Search',
//                   style: TextStyle(
//                       fontSize: 17, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//       ]),
//     );
//
//
//
//
//
//
//
//
//   }
//

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "Search Sanction Details",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.red.withOpacity(0.8)),

        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DropDownButton"),*/
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
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: dropdownvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;

                        if (dropdownvalue == "By Date") {
                          _show();
                          setState(() {
                            _visible = !_visible;
                            _amount_visible = false;
                            _sanction_visible = false;
                            _default_visible = false;
                          });

//isVisible=!isVisible;
                          /*  Visibility(
                      visible: isVisible,
                      child: TextField(
                          controller: dateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                                  labelText: "Enter Date" //label text of field
                                  ),
                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null ){
                                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                  dateinput.text = formattedDate; //set output date to TextField value.
                                  });
                                  }else{
                                  print("Date is not selected");
                                  }
                                  },),
                    );*/
                        }
                        else if (dropdownvalue == "By Sanction") {
                          setState(() {
                            _sanction_visible = !_sanction_visible;
                            _amount_visible = false;
                            _visible = false;
                          });
                        }

                        else if (dropdownvalue == "By Amount") {
                          setState(() {
                            _amount_visible = !_amount_visible;
                            _sanction_visible = false;
                            _visible = false;
                            _default_visible = false;
                          });
                          /* Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          child: TextField(

                         //   controller: schemeController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black), //<-- SEE HERE
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black), //<-- SEE HERE
                              ),
                            ),
                          ),
                        );*/
                        }
                      });
                    },
                    /*   buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,*/
                  ),
                ),
              )),

              /*Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: TextField(

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                ),
              ),*/

              Visibility(
                  visible: _default_visible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    child: SizedBox(height: 40,
                      child: GestureDetector(
                        onTap: (){ _focusNode.unfocus();},
                        child: TextField(
                          //   controller: schemeController,
                     //     focusNode: _focusNode,
                          decoration:
                          //InputDecoration(
                          /*  enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black), //<-- SEE HERE
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black), //<-- SEE HERE
                            ),
                        */
                            InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide(color: Colors.red)),

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
                  )

        ),


              Visibility(
                  visible: _default_visible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    child: TextField(
                      //   controller: schemeController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  )),


















              Visibility(
                  visible: _amount_visible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    child: TextField(
                      //   controller: schemeController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  )),

              Visibility(
                  visible: _sanction_visible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    child: TextField(
                      //   controller: schemeController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  )),

              Visibility(
                  visible: _visible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  )),

              /*Visibility(visible:_visible,child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0,20.0,0.0,0.0),
                child: Text("",style: TextStyle(fontSize: 17,color: Colors.red.withOpacity(0.8),fontFamily: 'RobotoBold',fontWeight: FontWeight.bold),
              ))),*/

              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                child: Center(
                  child: SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),

                        backgroundColor: Colors.red.withOpacity(0.8),

                        /*   padding: EdgeInsets.symmetric(
                          horizontal:
                          MediaQuery.of(context).size.width /
                              3.3,
                          vertical: 20)*/

                        // padding: EdgeInsets.only(
                        //     left: 120, right: 120, top: 20, bottom: 20),
                      ),
                      onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EForm()));*/

                        /*    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      backgroundColor: Colors.white,
      content: Text(
      'Validation Successful',
      style: TextStyle(
      color: Colors.black,
      ),
      ),
      ),
      );
*/
                        //}
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              //   ]),e_
              // );

              //),
              //),
            ],
            //   ),
            //   ],
          ),
        ),
      ),
    );
  }


  void _show() async
  {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
        _textEditingController.text = _selectedDateRange.toString();

        print(_selectedDateRange.toString());
      });
    }
  }
}
