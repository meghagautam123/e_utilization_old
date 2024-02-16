import 'package:e_utilization/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class WMSLayer extends StatelessWidget {
  static const String route = 'WMS layer';
   ImageData fruitDataModel;
   WMSLayer({Key? key, required this.fruitDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.red.withOpacity(0.8),title: Center(child: Text(fruitDataModel.name))),
    //  drawer: buildDrawer(context, route),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text('This is a map that is showing (42.58, 12.43).'),
            ),
            Flexible(

              child: FlutterMap(

                options: MapOptions(
                 /* center: LatLng(42.58, 12.43),
                  zoom: 6,*/
                  center: LatLng(42.58, 12.43),
                  zoom: 7,

                ),

               /* nonRotatedChildren: [
                  RichAttributionWidget(
                    popupInitialDisplayDuration: const Duration(seconds: 5),
                    attributions: [
                      TextSourceAttribution(
                        'Sentinel-2 cloudless - https://s2maps.eu by EOX IT Services GmbH',
                        onTap: () => launchUrl(
                          Uri.parse('https://s2maps.eu '),
                        ),
                      ),
                      const TextSourceAttribution(
                        'Modified Copernicus Sentinel data 2021',
                      ),
                      TextSourceAttribution(
                        'Rendering: EOX::Maps',
                        onTap: () => launchUrl(
                          Uri.parse('https://maps.eox.at/'),
                        ),
                      ),
                    ],
                  ),
                ],*/

                children: [


                  /*TileLayer(
                    wmsOptions: WMSTileLayerOptions(
                      baseUrl:'"https://bhuvan-vec1.nrsc.gov.in/bhuvan/nuis/gwc/service/wmts/',
                     layers: const['CG_CG_UL10K'],
                      format: 'image/png',
                      transparent: true,
                   //   baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
                  //    layers: const ['s2cloudless-2021_3857'],
                    ),
                //    subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
                  //  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),*/

                  /*TileLayer(wmsOptions: WMSTileLayerOptions(
                    baseUrl: 'https://apps.example.com:8080/myserver/wms/?',
                    layers: ['XYZLAYER:stateboundary'],
                    format: 'image/png',
                    transparent: true,
                  ),
                    backgroundColor: Colors.transparent,
                    userAgentPackageName: 'com.example.xyz',
                 //   tileProvider: CachedNetworkTileProvider(),
                  ),*/

                  //layers: ['XYZLAYER:stateboundary'],
                  /*TileLayer(wmsOptions: WMSTileLayerOptions(
                    baseUrl: 'https://server.arcgisonline.com/ArcGIS/rest/services/' +
                  'World_Topo_Map/MapServer/tile/{z}/{y}/{x}',

                    layers: ['TileLayer'],
                 //   format: 'image/png',
                  //  transparent: true,
                  ),*/
                    //backgroundColor: Colors.transparent,
                    //userAgentPackageName: 'com.example.xyz',
                    //   tileProvider: CachedNetworkTileProvider(),
              //    ),




















                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}