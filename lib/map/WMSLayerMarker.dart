import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WMSLayerMarker extends StatefulWidget
{


  @override
  State<WMSLayerMarker> createState() => _WMSLayerMarkerState();


}
class _WMSLayerMarkerState extends State<WMSLayerMarker>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  loadData();
  }
  // created empty list of markers
  final List<Marker> _markers = <Marker>[];

  // created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[

    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
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
                    child: FlutterMap(
                      options: MapOptions(
                        /*center: LatLng(42.58, 12.43),
                       zoom: 6,*/
                        center: LatLng(27.7099116, 85.3132343),
                        zoom: 4,
                        //      interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                      ),
                      //nonRotatedChildren: [],

                      children: [
                        TileLayer(
                          urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/' +
                              'World_Topo_Map/MapServer/tile/{z}/{y}/{x}',),


                        MarkerLayer(
                          markers: [
                           /* Marker(width:50,height:50,point:LatLng(27.91, 78.07),
                             rotate: false,
                                builder: (BuildContext context) {  })*/],

                           ),
                      ],),


                  )
                ]
            )));
  }
 /* loadData() async{
    for(int i=0 ;i<images.length; i++){
   //   final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(
          Marker(
            // given marker id
            markerId: MarkerId(i.toString()),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position: _latLen[i],
            infoWindow: InfoWindow(
              // given title for marker
              title: 'Location: '+i.toString(),
            ), point: null,
            builder:
          )
      );
      setState(() {
      });
    }
  }*/



}