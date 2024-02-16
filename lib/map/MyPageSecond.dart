import 'package:e_utilization/screens/e_uc_form_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as GeoLocationAccuracy;
import 'package:location_platform_interface/location_platform_interface.dart'
    as LocationPlatform;
import '../model/SearchSanctionModel.dart';


class MyPageSecond extends StatefulWidget {
  Data? userData;
  String? username;
  String? token;



 MyPageSecond(Data userData, String? username, String? token)
  {
    // this.datanew=datanew;
    this.userData = userData;
    this.username = username;
    this.token = token;
  }


  @override
  _MyMapPageSecond createState() => _MyMapPageSecond();
}

class _MyMapPageSecond extends State<MyPageSecond> {
  String _locationMessage = '';
  List<Marker> markers = [];
  List<LatLng> polygonPoints = [];
  LocationData? currentLocation;
  final MapController mapController = MapController();
  LatLng currentLatLng = LatLng(28.55, 77.22);
  List<LatLng> points = [];

  List<Map<String, double>> locationList = [];

  List<Polygon> Polygons = [
    Polygon(points: [
      LatLng(51.5251217665913, -0.08750429301284157),
      LatLng(51.52472895081553, -0.08759899699452944),
      LatLng(51.52334424817988, -0.08734645304377864),
      LatLng(51.52229341736876, -0.08707812509587143),
      LatLng(51.52165505036376, -0.0870465571028376),
      LatLng(51.52059435924525, -0.08723596506618492),
      LatLng(51.52045686043991, -0.08723596506618492),
      LatLng(51.52025061145315, -0.08523139745747699),
      LatLng(51.52126220468193, -0.0848367975335691),
      LatLng(51.521213098733455, -0.08355829378393764),
      LatLng(51.52200860857974, -0.08332153382906426)
    ], color: Colors.redAccent, isFilled: true)
  ];


  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    /*return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FlutterMap(
                options: MapOptions(
                    center: LatLng(51.5251217665913, -0.08750429301284157),
                    zoom: 14
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  PolygonLayer(
                    polygons: Polygons.sublist(0),
                  )
               ],
              ),
            )
          ],
        )
    );*/

    return Scaffold(
      appBar: AppBar(title: Text('Map with Polygon'),
          iconTheme: IconThemeData( color: Colors. white),
      ),

      body: Stack(
        children: [

      FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: currentLatLng, // Initial map center
          zoom: 5.0,

          /*onPositionChanged: (MapPosition pos, bool _)
          {
            // Update polygonPoints when map position changes
          updatePolygon(pos.center!);
          },*/
        ),
        children: [

          TileLayer(
            urlTemplate:
                'https://server.arcgisonline.com/ArcGIS/rest/services/' +
                    'World_Topo_Map/MapServer/tile/{z}/{y}/{x}',
            subdomains: ['a', 'b', 'c'],
          ),



          PolygonLayer(
            polygons: [
              Polygon(
                points: points,
                color: Colors.blue.withOpacity(0.5),
                borderStrokeWidth: 8,
                borderColor: Colors.blue,
              ),
            ],
          ),

          /*MarkerLayer(
            markers: markers,
          ),*/
        ],
      ),

      Positioned(
        /*bottom: 60.0,
            right: 16.0,
            left: 40.0,*/
        top: 30.0,
        left: 30.0,

          child: ElevatedButton(
            onPressed: () {
              //Handle button press action
              //You can add your functionality here
              print(' Save Button Pressed!'+locationList.toString());
              /*Data     data = Data(
                  schemeName: "jhjh",
                  allocatingMinistry:
                  "ghjg",
                  finYear: "2005",
                  unspentBalance:
                  "hghjgh",
                  status: "gfhg",
                  dateOfGen: "gender",
                  schemeCode: "fhgfhg",
                  lastDate: "gjgjg",
                  eucId: "hghg");*/


              /* Navigator.pushNamed(
                context,
                EFormCamera(data, "fhgfgh", "hjhj") as String,
                arguments: 'Hello from Map Page',
              );
              Navigator.pushNamed(
                context,
                '/screenB',
                arguments: 'YourData',
              );
              */
             //if(locationList!=null && !locationList.isEmpty)

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EFormCamera.fromScreen(widget.userData!, widget.username, widget.token,locationList),
                ),
              );



           /*Navigator.pushNamed(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchSanctionDemo(username,token)));
              */


             /*  Fluttertoast.showToast(
                      msg: 'points' + locationList.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.yellow);*/

             },
            child: SizedBox(
                width: 50, height: 30, child: Center(child: Text('Save'))),
          ),
        ),
      //),

     Positioned(
      top: 400,
       left: 50,
       child: SizedBox(
          width: 150,
          height: 50,
          child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  /*currentLatLng = LatLng(currentLatLng.latitude + 0.01, currentLatLng.longitude + 0.01);
               updatePolygon(currentLatLng);*/
                  _listenToLocation();
                });
              },

              //child: Icon(Icons.update)),
              child: Text("Capture Lat Lng")),
        ),
     ),

   ]),

    );
  }

  // Method to update polygonPoints list based on the new position
  void updatePolygon(LatLng center) {
    setState(() {
      //   polygonPoints.clear(); // Clear previous points
      // Define polygon points based on the new center (for demonstration, create a square)
      /*polygonPoints.add(center);
       polygonPoints.add(LatLng(center.latitude + 0.01, center.longitude));
       polygonPoints.add(LatLng(center.latitude + 0.01, center.longitude + 0.01));
       polygonPoints.add(LatLng(center.latitude, center.longitude + 0.01));

*/
      polygonPoints.add(center);
      polygonPoints.add(LatLng(center.latitude + 0.01, center.longitude));
      /*  polygonPoints.add(LatLng(center.latitude+ 0.01, center.longitude+ 0.01));
       polygonPoints.add(LatLng(center.latitude , center.longitude+ 0.01));
*/
    });
    print("polygonpoints123456" + polygonPoints.toString());

    Fluttertoast.showToast(
        msg: 'Invalid username or password' + center!.latitude.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);



  }

//  }

// Method to update polygonPoints list based on the new position
/*void updatePolygon(LatLng center) {
  setState(() {
    polygonPoints.clear(); // Clear previous points
    // Define polygon points based on the new center (for demonstration, create a square)
    polygonPoints.add(center);
    polygonPoints.add(LatLng(center.latitude + 0.01, center.longitude));
    polygonPoints.add(LatLng(center.latitude + 0.01, center.longitude + 0.01));
    polygonPoints.add(LatLng(center.latitude, center.longitude + 0.01));
  });
}*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*var geolocator = Geolocator();
     var locationOptions = LocationOptions(accuracy: LocationAccuracy.high,
        distanceFilter: 10);

     StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null ? 'Unknown' : position.latitude.toString() + ', ' +
          position.longitude.toString());
    });*/
    //getLatLongitude();
    // _initLocationTracking();
    // _listenToLocation();
  }

  Future<void> _getLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          setState(() {
            _locationMessage = 'Location services are disabled.';
          });
          return;
        }
      }
      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          setState(() {
            _locationMessage = 'Location permissions are denied.';
          });
          return;
        }
      }

      LocationData currentLocation = await location.getLocation();

      setState(() {
        _locationMessage =
            'Latitude: ${currentLocation.latitude}, Longitude: ${currentLocation.longitude}, Accuracy: ${currentLocation.accuracy}';
      });
    } catch (e) {
      setState(() {
        _locationMessage = 'Failed to get location: $e';
      });
    }
  }

  /*  void _initLocationTracking() async {
     Location location = Location();

     bool serviceEnabled;
     PermissionStatus permissionGranted;

     serviceEnabled = await location.serviceEnabled();
     if (!serviceEnabled) {
       serviceEnabled = await location.requestService();
       if (!serviceEnabled) {
         return;
       }
     }

     permissionGranted = await location.hasPermission();
     if (permissionGranted == PermissionStatus.denied) {
       permissionGranted = await location.requestPermission();
       if (permissionGranted != PermissionStatus.granted) {
         return;
       }
     }

     location.onLocationChanged.listen((LocationData newLocation) {

       setState(() {
         currentLocation = newLocation;
        // _points.add(LatLng(newLocation.latitude!, newLocation.longitude!));
       });

       updatePolygon(LatLng(currentLocation!.latitude!, currentLocation!.longitude!));


       Fluttertoast.showToast(
           msg: 'Invalid username or password'+currentLocation!.latitude.toString(),
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.yellow
       );

    // print("pointer"+_points.toString());
     });



   }

  Future<void> getLatLongitude() async {


    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    location.onLocationChanged.listen((event) {

    print("longitude"+ event.longitude.toString());
    print("latitude"+  event.latitude.toString());

     updatePolygon(LatLng(event.latitude!, event.longitude!));

   });
   }*/

  Future<void> _listenToLocation() async {
    /* Geolocator.getPositionStream()
        // desiredAccuracy: LocationAccuracy.high, distanceFilter: 10)
         .listen((Position position) */
    //  {

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: GeoLocationAccuracy.LocationAccuracy.best);
    //  {
    Map<String, double> location = {
      'latitude': pos.latitude,
      'longitude': pos.longitude,
    };

    setState(() {
      //points.add(LatLng(position.latitude, position.longitude));

      if (points.length < 5)
      {
      // var latitude;
      LatLng currentLatLng = LatLng(pos.latitude, pos.longitude);
      points.add(currentLatLng);
      locationList.add(location);
      print("locationlist12345"+locationList.toString());
      }

  else
  {
    Fluttertoast.showToast(
        msg: 'You can not add more than 15' ,

        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }




      /*if(points.isEmpty || points.last != currentLatLng) {
           points.add(currentLatLng);
           }*/


      /*markers.add(
           Marker(
             width: 80.0,
             height: 80.0,
             point: currentLatLng,
             builder: (ctx) => Icon(Icons.location_on, color: Colors.red),
           ),
         );
    */

      print("" + points.toString());
    });

    //}
    Fluttertoast.showToast(
        msg: 'Latitude&Longitude ' +
            pos.latitude.toString() +
            pos.longitude.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    //    }
    //}
    // );
  }

/*
     void _setPolygon()
     {
      //final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
     _polygons.add(Polygon(
     //polygonId: PolygonId(polygonIdVal),
       points: polygonLatLngs,
       //strokeWidth: 2,
       //strokeColor: Colors.yellow,
      borderStrokeWidth: 2,
      borderColor: Colors.yellow ,
       color: Colors.yellow.withOpacity(0.15),
     )
     );
     }*/
}

/*
class MapWithPolygon extends StatefulWidget {
  @override
  _MapWithPolygonState createState() => _MapWithPolygonState();
}

class _MapWithPolygonState extends State<MapWithPolygon> {
  MapController mapController = MapController();
  List<LatLng> _points = [];

  // Method to handle position changes
  void _handlePositionChange(LatLng newPosition) {
    setState(() {
      _points.add(newPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Polygon')),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(0, 0), // Initial map center
          zoom: 10.0, // Initial zoom level
          onPositionChanged: (position, hasGesture) {
            // Call _handlePositionChange when the map position changes
            _handlePositionChange(position.center);
          },
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: _points, // List of LatLng points defining the polygon
                strokeWidth: 2.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/
