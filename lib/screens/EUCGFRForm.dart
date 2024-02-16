import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
/*import 'PdfApi.dart';*/
import 'package:pdf/widgets.dart' as p;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../pdf/PdfViewerPage.dart';

//Download pdf in ios
//https://pspdfkit.com/blog/2022/download-and-display-pdf-in-flutter-with-pspdfkit/
class EUCGFRForm extends StatefulWidget {
  /*@override
  State<EUCGFRForm>() => _EUCGFRFormState();*/

  @override
  State<EUCGFRForm> createState() => _EUCGFRFormState();
}

class _EUCGFRFormState extends State<EUCGFRForm> {
  String dropdownvalue = 'Centrally Sponsored Scheme';
  String dropdownrecurringvalue = 'Recurring';
  TextEditingController cashController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController unspentController = TextEditingController();
  String val = "2002-2012";

  var items = [
    'Centrally Sponsored Scheme',
    'Sahakar Matra Scheme',
  ];

  var recurringitems = [
    'Recurring',
    'Non Recurring',
  ];
 final TextEditingController cashHandController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "E-UC GFR Form 12A",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.red.withOpacity(0.8)),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(
                  "UTILIZATION CERTIFICATE FOR THE YEAR " +
                      val +
                      " in respect of recurring/non-recurring GRANTS-IN-AID/SALARIES/CREATION OF CAPITAL ASSETS",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Text(
              "Name of the Scheme ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Container(
                  width: 280,
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
                            });
                          })))),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Text(
              "Whether recurring or non-recurring agents",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Container(
                  width: 280,
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
                          items: recurringitems
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
                          value: dropdownrecurringvalue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownrecurringvalue = newValue!;
                            });
                          })))),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Text(
              "Grants position at the beginning of the Financial Year ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  "(i)",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),

              //SizedBox(width: 5,),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                child: Text(
                  "Cash in Hand/Bank ",

                  style: TextStyle(

                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),


              //   ),
            ],
          ),

             /*     child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0,5.0,0.0,0.0),*/

                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0,5.0,0.0,0.0),
                    child: SizedBox(
                      width: 130,
                      height: 30,

                        child: TextField(
                          controller: cashHandController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black), //<-- SEE HERE
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black), //<-- SEE HERE
                            ),
                          ),
                        ),
                      //),
                    ),
                  ),

                 Row(

            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: Text(
                  "(ii)",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              //SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                child: Text(
                  "Unad|usted advances ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              //   ),
            ],
          ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 5.0, 0.0, 0.0),
                    child: SizedBox(
                      width: 130,
                      height: 30,
                      child: TextField(
                        controller: advanceController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                                width: 1, color: Colors.black), //<-- SEE HERE
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                                width: 1, color: Colors.black), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                  ),


          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             /* Flexible(

                child: */
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: Text(
                    "(iii)",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
             // ),

              //SizedBox(width: 5,),

               Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                  child: Text(
                    "Total ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              //),
]),


            /*  Flexible(
                flex: 2,
                child:*/ Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 5.0, 10.0, 0.0),
                  child: SizedBox(
                    width: 130,
                    height: 30,
                    child: TextField(
                        controller: totalController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                ),
              //),
              // ),
  //          ],
    //      ),

    Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Text(
              "Details of grants received,expenditure incurred and closing balances: (Actuals) ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Unspent Balances of Grants Received years ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              ),
            ),

            //SizedBox(width: 5,),

            /*Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
              child: Text("Cash in Hand/Bank ",
                style: TextStyle(fontSize: 15,color: Colors.black, fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),

              ),
            ),*/

            /*SizedBox(width:230,height: 30,
              child:*/

            SizedBox(
              width: 250,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: TextField(
                  controller: unspentController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),

            //   ),

            /*TextField(

              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                      width: 1, color: Colors.black), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(

                      width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Interest Earned Theoren ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              width: 250,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Interest deposited back to the government ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              width: 250,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Grant received during the year ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(i).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Sanction No: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(ii).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Date: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(iii).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Amount: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    "Total available funds: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    "Expenditure Incurred: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    "Closing Balances: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Component wise utilization of grants: ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'RobotoBold',
                    fontWeight: FontWeight.bold),
              ),
            ),

            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  "Grant-in-aid-General: ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("4321"),
              )
            ]),


            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  "Grant-in-aid-Salary: ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("4321"),
              )
            ]),



            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  "Grant-in-aid-creation of capital assets: ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("4321"),
              )
            ]),

            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  "Total: ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("4321"),
              )
            ]),


            Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child:  Text("Details of grants position at the end of the year", style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'RobotoBold',
              fontWeight: FontWeight.bold),),),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(i).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Cash in Hand/Bank: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),






            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(ii).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Unad|usted advances: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "(iii).",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    "Total: ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text("4321"),
                )
              ],
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    0.0, 20.0, 0.0, 30.0),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton.icon(
                   icon: Image.asset('assets/images/download_pdf_icon.png', width: 40, height: 40),
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

                    onPressed: ()  {
                     makePdf();


                    },
                   label:Text(
                     'Download as PDF',

                     style: TextStyle(
                         fontSize: 19, color: Colors.white),
                   ),
                    /*child: const Text(
                      'Download as PDF',

                      style: TextStyle(
                          fontSize: 19, color: Colors.white),
                    ),*/
                  ),

                ),
              ),
            ),


            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    0.0, 0.0, 0.0, 30.0),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Image.asset('assets/images/download_pdf_icon.png', width: 40, height: 40),
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

                    onPressed: ()  {
                      //makePdf();
                  //    _openDocument();
                      SfPdfViewer.file(
                        File('storage/emulated/0/Android/data/com.example.e_utilization/files/gfrform.pdf'),
                      );
                    },
                    label:Text(
                      'View PDF',

                      style: TextStyle(
                          fontSize: 19, color: Colors.white),
                    ),
                    /*child: const Text(
                      'Download as PDF',

                      style: TextStyle(
                          fontSize: 19, color: Colors.white),
                    ),*/
                  ),

                ),
              ),
            ),





          ]),
        ])));
  }

  Future<void> makePdf() async{

    final pdf = p.Document();

    pdf.addPage(
        p.Page(build: (context){
          return

            p.Column(
              children: [


                p.Text(
                  "E-UC GFR Form 12A",

                  style: p.TextStyle(
                      fontSize: 20,
                   color: PdfColors.black,
                 /*  fontStyle: 'RobotoBold',
                    fontWeight: FontWeight.bold*/

                  //fontStyle: ,
                  fontWeight:p.FontWeight.bold

                  ),
                ),
             //   PdfPageFormat.a4.applyMargin(left:10, top: 10, right: 0, bottom: 0),

                p. Row(
                    children: [
                p.Padding(
                padding: p. EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                child:


            p.Text(
                    "Name of the Scheme: ",
                    style: p.TextStyle(
                        fontSize: 20,
                        color: PdfColors.black,
                        fontWeight:p.FontWeight.bold),
                  ),
      ),

                 /* p.Text(
            //   p    cashHandController.text.toString();
                   //  cashHandController.text.toString()
                  ),
*/
          p.Padding(
          padding: p. EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
          child:
                      p.Text("Centrally Sponsored",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
          ),
         // ),
          ), ]),



                p. Row(
                    children: [
                      p.Padding(
                        padding: p.EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Whether recurring or non-recurring agents: ",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("Recurring",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),



                p.Padding(
                  padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  child:
                  p.Text("Grants position at the begging of the Financial Year",  style: p.TextStyle(
                    fontSize: 20,
                    color: PdfColors.black,
                      fontWeight:p.FontWeight.bold
                  )
                  ),
                  // ),
                ),


                p. Row(
                    children: [
                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(i):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Cash in Hand/Bank:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(cashHandController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),



                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(ii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Unad|usted advances:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(advanceController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),


                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(iii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),





                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Total:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(totalController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),


                p.Padding(
                  padding: p. EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                  child:
                  p.Text("Details of grants received,expenditure incurred and closing balances",  style: p.TextStyle(
                    fontSize: 20,
                    color: PdfColors.black,
                      fontWeight:p.FontWeight.bold
                  )
                  ),
                  // ),
                ),

                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(i):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Unspent Balances of Grants received years:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(unspentController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),






                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(ii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Interest Earned Theoren:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(unspentController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),



                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(iii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Interest deposited back to the Government:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(unspentController.text.toString(),  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),


                p.Padding(
                  padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child:
                  p.Text(
                    "Grant received during the year:",
                    style: p.TextStyle(
                        fontSize: 20,
                        color: PdfColors.black,
                        fontWeight:p.FontWeight.bold),
                  ),
                ),




                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(i):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Sanction No:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("8765432",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),



                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(ii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Date:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("8765432",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),



                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "(iii):",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),



                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text(
                          "Amount:",
                          style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold),
                        ),
                      ),


                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("8765432",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ), ]),


          p. Row(
          children: [
                p.Padding(
                  padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  child:
                  p.Text("Total available funds:",  style: p.TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                      fontWeight:p.FontWeight.bold
                  )
                  ),
                  // ),
                ),

            p.Padding(
              padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child:
              p.Text("8765432",  style: p.TextStyle(
                fontSize: 20,
                color: PdfColors.black,
              )
              ),
              // ),
            ),





        ]),

          p. Row(
          children: [

                p.Padding(
                  padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  child:
                  p.Text("Expenditure incurred:",  style: p.TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                      fontWeight:p.FontWeight.bold
                  )
                  ),
                  // ),
                ),


            p.Padding(
              padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child:
              p.Text("8765432",  style: p.TextStyle(
                fontSize: 20,
                color: PdfColors.black,
              )
              ),
              // ),
            ),



          ]),

                p. Row(
                    children: [

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("Closing Balances:",  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                            fontWeight:p.FontWeight.bold
                        )
                        ),
                        // ),
                      ),

                      p.Padding(
                        padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child:
                        p.Text("8765432",  style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                        )
                        ),
                        // ),
                      ),
                    ]),







                /*  p.Text("AndroidCoding.in"),
                p.Text("Tested")*/
              ]
          );
        })
    );

    pdf.addPage(
        p.Page(build: (context){
          return

            p.Column(
                children: [

                  p.Padding(
                    padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                    child:
                    p.Text(
                      "Component wise utilization of grants:",
                      style: p.TextStyle(
                          fontSize: 20,
                          color: PdfColors.black,
                          fontWeight:p.FontWeight.bold),
                    ),
                  ),


                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("Grant-in-aid-General:",  style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold
                          )
                          ),
                          // ),
                        ),

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("8765432",  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ),
                      ]),


                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("Grant-in-aid-Salary:",  style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold
                          )
                          ),
                          // ),
                        ),

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("8765432",  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ),
                      ]),


                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("Grant-in-aid-creation of capital assets:",  style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold
                          )
                          ),
                          // ),
                        ),

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("8765432",  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ),
                      ]),


                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("Total:",  style: p.TextStyle(
                              fontSize: 20,
                              color: PdfColors.black,
                              fontWeight:p.FontWeight.bold
                          )
                          ),
                          // ),
                        ),

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text("8765432",  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ),
                      ]),


                  p.Padding(
                    padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                    child:
                    p.Text("Details of grants position at the end of the year",  style: p.TextStyle(
                        fontSize: 20,
                        color: PdfColors.black,
                        fontWeight:p.FontWeight.bold
                    )
                    ),
                    // ),
                  ),

                  p. Row(
                      children: [
                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "(i):",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),



                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "Cash in Hand/Bank:",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),


                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(cashHandController.text.toString(),  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ), ]),



                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "(ii):",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),



                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "Unad|usted advances:",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),


                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(advanceController.text.toString(),  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ), ]),


                  p. Row(
                      children: [

                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "(iii):",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),





                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(
                            "Total:",
                            style: p.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight:p.FontWeight.bold),
                          ),
                        ),


                        p.Padding(
                          padding: p. EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          child:
                          p.Text(totalController.text.toString(),  style: p.TextStyle(
                            fontSize: 20,
                            color: PdfColors.black,
                          )
                          ),
                          // ),
                        ), ]),






                ]
            );
        })
    );

     final directory = await getExternalStorageDirectory();
    //Directory root = await getApplicationDocumentsDirectory();
    final file = File("${directory?.path}/gfrform.pdf");
    String path = '${directory?.path}/gfrform.pdf';
    //final file = File(path);
    await file.writeAsBytes(await pdf.save());
    print("Path  "+path);



    Fluttertoast.showToast(
        msg: 'Pdf created successfully'+path,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  }





  Future<void> getPdf(Uint8List screenShot) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Center(
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    final output = File('Your path + File name');
    await output.writeAsBytes(await pdf.save());
  }



}
