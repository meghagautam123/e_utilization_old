import 'package:flutter/material.dart';

//For Dynamic data
/*
Widget build(BuildContext context) {
  var list = [{'id':"123123","date":"20/08/2016"},{'id':"123124","date":"26/08/2016"},{'id':"123125","date":"26/08/2016"}];
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Text('Recent Claims'),
  Table(
  border: TableBorder.all(color: Colors.black),
  columnWidths: {
  0: FixedColumnWidth(100.0),
  1: FixedColumnWidth(100.0)
  },
  children:[
  for(var item in list )  TableRow(children: [
  Text(item['id']),
  Text(item['date']),
  ])]
  ),
*/

class ViewSubmittedUCFragment extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      /*appBar: AppBar(
        //title:Text("Table Widget"),
        backgroundColor: Colors.amberAccent,
      ),*/
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "View E UC Data Submitted By Agency Maker",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(4),
            },
            border: TableBorder.all(color: Colors.lightBlueAccent, width: 2.0),
            children: [
              TableRow(children: [
                Text(
                  "Scheme",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),
              TableRow(children: [
                Text(
                  "Unspent Bal",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),
              TableRow(children: [
                Text(
                  "FY",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),


              TableRow(children: [
                Text(
                  "Expenditure",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),

              TableRow(children: [
                Text(
                  "Photos",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),

              TableRow(children: [
                Text(
                  "GeoTag Location",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),

              TableRow(children: [
                Text(
                  "Time and Date",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),

              ]),
             

            ],
          ),
        ),

        
       Text("Add Remarks",style: TextStyle(fontSize: 20.0,)),
SizedBox(height: 80,),
        Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    0.0, 0.0, 0.0, 30.0),
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0)),
                      backgroundColor:
                      Colors.red.withOpacity(0.8),
                      /*  padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context).size.width /
                                                        3.3,
                                                vertical: 20)*/
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 15, bottom: 15),
                    ),
                    onPressed: () {
                      //}
                     // _validateInputs();
                    },
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                          fontSize: 17, color: Colors.white),
                    ),
                  ),
             ),
              ),

SizedBox(width: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    0.0, 0.0, 0.0, 30.0),
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0)),
                      backgroundColor:
                      Colors.red.withOpacity(0.8),
                      /*  padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context).size.width /
                                                        3.3,
                                                vertical: 20)*/
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 15, bottom: 15),
                    ),
                    onPressed: () {
                      //}
                      // _validateInputs();
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                          fontSize: 17, color: Colors.white),
                    ),
                  ),
            ),
              ),





            ],







          ),
        ),



















      ]),
    );
  }
















  }


