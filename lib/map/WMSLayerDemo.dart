
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class WMSLayerDemo extends StatelessWidget {

  var infoWindowVisible = false;
  GlobalKey<State> key = new GlobalKey();
final List<Marker> _markers=<Marker>[];
final List<LatLng> _latlng=<LatLng>[LatLng(33.6941, 72.9734),LatLng(33.7088, 72.9262),LatLng(33.6939, 72.9711)];

// List<Marker> _marker= [];

  /*final List<Marker> _list = [
    Marker(markerId:MarkerId('1'),
        position:LatLng(latitude, longitude),
        point: ,
        builder: ),
    Marker(markerId:MarkerId('2'),
        position:LatLng(latitude, longitude)),



  ];
*/



  Stack _buildCustomMarker() {
    return Stack(
      children: <Widget>[
        popup(),
        marker23()
      ],
    );
  }

  var marker = <Marker>[
    Marker(
     // point: LatLng(21.2350089, 72.858609),
      point:LatLng(27.7099116, 85.3132343),
      builder:(ctx) {return getMarker();
   //  }
     },
    ),
    Marker(
     //  point: LatLng(21.2357639, 72.8567261),
      point:LatLng(27.7137735, 85.315626),
      builder: (context) {
        return getMarker();
      },
    ),
   /* Marker(
      point: LatLng(21.2357639, 72.8567261),
      builder: (context) {
        return getMarker();
      },
    ),
    Marker(
      point: LatLng(21.2350089, 72.858609),
      builder: (context) {
  return getMarker();
  },

     // },
    ),*/
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(

                children: [ /*const Padding(
    padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Text('This is a map that is showing (42.58, 12.43).'),
        ),*/
                  Flexible(
                    child:
                    FlutterMap(
                      options: MapOptions(

                        center: LatLng(27.7099116, 85.3132343),
                        zoom: 4,

                      ),

                      children: [

                        TileLayer(
                          urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/' +
                              'World_Topo_Map/MapServer/tile/{z}/{y}/{x}',),

    MarkerLayer(

      markers:
     // [

      /*Marker(width: 50,
            height: 50,
            point: LatLng(27.91, 78.07),

            builder: (ctx) => _buildCustomMarker(),


            rotate: false)*/

      //],
marker
    ),
                //  )







                      ],),


                  )
                ]
            )));




  }



  Opacity popup() {
    return Opacity(
      opacity: infoWindowVisible ? 1.0 : 0.0,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 279.0,
        height: 256.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_info_window.png"),
                fit: BoxFit.cover)),
        //     child: CustomPopup(key: key),
      ),
    );
  }

  Opacity marker23() {
    return Opacity(
      child: Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/ic_marker.png',
            width: 49,
            height: 65,
          )),
      opacity: infoWindowVisible ? 0.0 : 1.0,
    );
  }

  static getMarker() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),

      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/1946/1946770.png',
        // Icons.pin_drop_outlined,
        height: 30,
        fit: BoxFit.cover, // color: Colors.red,
      ),
    );
  }

}