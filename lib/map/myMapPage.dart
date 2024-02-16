import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';


class MyMapPage extends StatefulWidget
{
  @override
  _MyMapPageState createState() => _MyMapPageState();
  
}

 class _MyMapPageState extends State<MyMapPage> {
  final MapController mapController = MapController();
  final CustomInfoWindowController customInfoWindowController= CustomInfoWindowController();
  // List of markers with custom info windows


  final List<LatLng> pointsList = [
    LatLng(28.6429, 77.3402),
    LatLng(28.5640, 77.2342),
    //LatLng(52.518, 13.397),
    // Add more points as needed
  ];




  final List<Marker> markers = [

    Marker(
      width: 30.0,
      height: 30.0,
      point: LatLng(28.6429, 77.3402), // San Francisco

      builder: (ctx) =>
          Container(
            child: GestureDetector(
              onTap: () {
            _showCustomInfoWindow(ctx, 'Vaishali',LatLng(28.6429, 77.3402));
              },
              child: Icon(
                Icons.location_pin,
                color: Colors.blue,
                size: 30.0,
              ),
            ),
          ),
    ),

    Marker(
      width: 30.0,
      height: 30.0,
      point: LatLng(28.5640, 77.2342), // Los Angeles

      builder: (ctx) =>
          Container(
            width: 20,
            height: 20,
            child: GestureDetector(

              onTap: () {
                _showCustomInfoWindow(ctx, 'Moolchand',LatLng(28.5640, 77.2342));
              },
              child: Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 30.0,
              ),
            ),
          ),
    ),

   /* Marker(
      width: 30.0,
      height: 30.0,
      point: LatLng(40.7128, -74.0060), // New York City
      builder: (ctx) =>
          Container(
            child: GestureDetector(
              onTap: () {
                _showCustomInfoWindow(ctx, 'New York City',LatLng(40.7128, -74.0060));
              },
              child: Icon(
                Icons.location_pin,
                color: Colors.green,
                size: 30.0,
              ),
            ),
          ),
    ),*/
 //   CustomInfoWindow(controller: customInfoWindowController,width: 20,height:30 ,)



  ];


 /* PopupMarkerLayerOptions(
  markers :
  [
  PopupMarker(
  marker: Marker(
  width: 45.0,
  height: 45.0,
  point: LatLng(51.5, -0.09), // Coordinates of the marker
  builder: (BuildContext context) {
  return Icon(
  Icons.pin_drop,
  color: Colors.red,
  ); // Replace with your marker icon
  },
  ),
  popupBuilder: (BuildContext context, Marker marker) {
  return YourCustomWindowWidget(); // Replace with your custom window widget
  },
  ),
  // Add more markers with custom pop-up windows if needed
  ],
  )
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Flutter Map with Custom Info Windows'),
      ),*/

        body: Padding(
        padding: const EdgeInsets.all(8),

            child: Column(

      children: [
        /*const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Text('This is a map that is showing (42.58, 12.43).'),
        ),*/

      Flexible(
    child: FlutterMap(
        mapController: mapController,

      options: MapOptions(
          center: LatLng(28.6429, 77.3402), // Initial map center
          zoom: 5.0, // Initial zoom level
        ),

        children: [
          TileLayer(
            urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/' +
                'World_Topo_Map/MapServer/tile/{z}/{y}/{x}',),

          MarkerLayer(
            markers: markers,
            // Use the list of markers
           ),

          PolylineLayer(
            polylines: [
              Polyline(
                points: pointsList,
                color: Colors.blue,
                strokeWidth: 4.0,
              ),
            ],
          ),

      ],

      ),

    ),
      ])));
  }

}

 void _showCustomInfoWindow(BuildContext context, String s, LatLng latLng)
 {
  double Latitude  = latLng.latitude;
  double Longitude = latLng.longitude;
   showDialog(
     context: context,
     builder: (context) {
       return AlertDialog(
         title: Text('Location: $s'),
         content: Text('Latitude:'+Latitude.toString()+","+'Longitude:'+Longitude.toString()),

         /*actions: [
           TextButton(
             onPressed: () {
               Navigator.of(context).pop();
             },
             child: Text('Close'),
           ),
         ],*/



       );
     },
   );





 }





