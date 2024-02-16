import 'package:e_utilization/fragments/ViewEUCListFragment.dart';
import 'package:flutter/material.dart';
import '../fragments/RejectedEntriesFragment.dart';
import '../fragments/ViewReportFragment.dart';
import '../fragments/ViewSubmittedUCFragment.dart';

class DrawerItem {
  String title;

  DrawerItem(this.title);
}

class navigationDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DrawerActivityState();
  }
}

class DrawerActivityState extends State<navigationDrawer> {
  late int tappedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tappedIndex = 0;
  }

  final List<String> _listViewData = [
    "View E-UC Submitted By Agency Makers",
    "View Rejected Entries",
    "View Submitted UC",
    "View Reports"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red.withOpacity(0.8),
          title: Center(child: new Text(_listViewData[tappedIndex])),
        ),
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Container(
                color: Colors.red.withOpacity(0.8),
                child: ListView.separated(
                  padding: EdgeInsets.all(10.0),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.white, height: 1.6),
                  itemCount: _listViewData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          _listViewData[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            tappedIndex = index;
                          });
                        });
                  },
                )),
          ),
        ),
        //   ),

        body: _getScreen(tappedIndex));
  }

  _getScreen(int selection) {
    switch (selection) {
      case 0:
        return ViewEUCListFragment();

      case 1:
        return RejectedEntriesFragment();

      case 2:
        return ViewSubmittedUCFragment();

      case 3:
        return ViewReportFragment();

      default:
    }
  }
}
