import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';

class MyPageThird extends StatefulWidget {
  @override
  _MapWithClickablePolygonPointsState createState() =>
      _MapWithClickablePolygonPointsState();
}

class _MapWithClickablePolygonPointsState extends State<MyPageThird> {
  List<LatLng> polygonPoints = [
    LatLng(51.5, -0.09),
    LatLng(51.5, -0.10),
    LatLng(51.51, -0.10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Clickable Polygon Points'),
      ),

      /*body:FlutterMap(
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
        ),
      ),
*/
      body: Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                center: LatLng(37.7749, -122.4194), // Initial map coordinates
                zoom: 12.0,
              ),
//    layers: [

              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                // Other map layers can be added here if needed
                //  ],
              ]),

          ElevatedButton(
            onPressed: () {
              //Handle button press action
              //You can add your functionality here
              print(' Save Button Pressed!');
              Fluttertoast.showToast(
                  msg: 'points',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.yellow);
            },
            child: SizedBox(
                width: 50, height: 30, child: Center(child: Text('Save'))),
          ),

          Positioned(
            bottom: 16, // Adjust position as needed
            right: 16, // Adjust position as needed
            child: FloatingActionButton(
              onPressed: () {
                // Action when button is pressed
                // You can perform any action here
                print('Button pressed!');
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
