import 'package:e_utilization/navigationDrawer/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewEUCListFragment extends StatefulWidget {

  @override
  State<ViewEUCListFragment> createState() => _HomeScreen();
}

class _HomeScreen extends State<ViewEUCListFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*appBar: AppBar(
        //title:Text("Table Widget"),
        backgroundColor: Colors.amberAccent,
      ),*/
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "List of E UC Submitted By Agency Maker",
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
                  "1",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),
              ]),
              TableRow(children: [
                Text(
                  "2",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 15.0),
                ),
              ]),
              TableRow(children: [
                Text(
                  "3",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "",
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
      ]),
    );
  }
}
