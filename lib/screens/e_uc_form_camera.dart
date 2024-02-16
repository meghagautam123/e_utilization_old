import 'dart:core';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:device_info/device_info.dart';
import 'package:e_utilization/database/DbManager.dart';
import 'package:e_utilization/map/MyPageSecond.dart';
import 'package:e_utilization/model/EUCFormCameraModel.dart';
import 'package:e_utilization/model/SubmitModel.dart';
import "package:geocoding/geocoding.dart";
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../model/SearchSanctionModel.dart';


class EFormCamera extends StatefulWidget {
  Data? userData;
  String? username;
  String? token;
  List<Map<String, double>>? locationList;


  EFormCamera(Data userData, String? username, String? token)
  {
    // this.datanew=datanew;
    this.userData = userData;
    this.username = username;
    this.token = token;
  }



  EFormCamera.fromScreen(Data userData, String? username, String? token, List<Map<String, double>> locationList ) {
    // this.datanew=datanew;
    this.userData = userData;
    this.username = username;
    this.token = token;
     this.locationList = locationList;
  }


  @override
  State<EFormCamera> createState() => _EFormCameraState();
   }

class _EFormCameraState extends State<EFormCamera> {
  bool isLoading = false;
  String? _base64Image;
  String? compressImageBytes;
  late AndroidDeviceInfo androidInfo;
  String? _currentAddress;
  Position? _currentPosition;
  late String baseNew;
  late String? encodeImage;
  late IosDeviceInfo iosInfo;
  int i = 69;
  File? imageFile;
  List<File> _imageList = [];
  bool _visible = false;
  String latitude = "";
  String longitude = "";
  TextEditingController schemeController = TextEditingController();
  TextEditingController fyController = TextEditingController();
  TextEditingController expenditureController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  DbManager dbHandler = DbManager();
  var image;
  List imageArray = [];
  final ImagePicker picker = ImagePicker();
  String location = 'Null, Press Button';
  String Address = 'search';
  bool visible = false;
  String stringValue = "";

// late final String _base64String;
  late CameraController _controller;
  List<CameraDescription> cameras = [];


  loadProgress() {
    /* if (visible == true) {
      setState(() {
        visible = false;
      });
    }*/

    setState(() {
      visible = true;
    });
    // }
  }

  /*

  Future<List<Address>> getAddress(double lat, double lang) async {
    final coordinates = new Coordinates(latitude, longitude);
    List<Address> address =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return address;
  }
*/

  _openCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    imageArray.add(image);
    setState(() {
      imageArray;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initializeCamera();

    schemeController.text = widget.userData!.schemeName.toString();
    fyController.text = widget.userData!.finYear.toString();
    expenditureController.text = widget.userData!.unspentBalance.toString();

    _getDeviceInfo();
    getName();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    stringValue = prefs.getString('saveName')!;
    // return stringValue;

    /* Fluttertoast.showToast(
        msg: 'Name Saved Successfully'+stringValue!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );*/
  }


  Future<void> _getDeviceInfo() async {
    if (Platform.isAndroid)
    {
      androidInfo = await DeviceInfoPlugin().androidInfo;
      print('Device Model: ${androidInfo.model}');
      print('Device Manufacturer: ${androidInfo.manufacturer}');
      print('Device ID: ${androidInfo.androidId}');
    }
    else if (Platform.isIOS)
    {
      iosInfo = await DeviceInfoPlugin().iosInfo;
      print('Device Model: ${iosInfo.utsname.machine}');
      print('Device Manufacturer: Apple');
      // Unique identifier for iOS devices may vary.
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData( color: Colors. white),
          title: Center(
              child: Text(
            "E-UC Form",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'RobotoBold',
                fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.red.withOpacity(0.8)),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /*  Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        child: Text(
          "E UC Form ",
          style: TextStyle(
              color: Colors.brown, fontFamily: 'RobotoBold', fontSize: 20),
        ),
    ),*/
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
            child: Text(
              "Scheme Name",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: TextField(
              controller: schemeController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              "FY",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: TextField(
              controller: fyController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              "Expenditure",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: TextField(
              controller: expenditureController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Capture Photos Button
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 15.0),
            child: SizedBox(
              width: 170,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  //selectImages();

                  //   requestCameraPermission;
                  //  if (_imageList.length < 2) {
                  _getFromCamera();
                  /* } else {
                    showToast();
                  }*/
                },
                child: const Text(
                  'Capture Photos',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),

          if (imageFile != null)
//if(_imageList.length)
            /*Container( child: Image.file(
                  imageFile!!, width: 200,
                   height: 200))*/

            /*    Expanded(
                    child:*/

            Container(
                width: 150,
                height: 150,
                child:
                    /*ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          return null;
                        },
                        child:*/

                    Card(
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: /*Text(_imageList[index].path),*/
                            Image.file(File(imageFile!.path))),

                    //Image.file(File(image!.path)
                  ),
                )),
          //);
          //}
          //  ),
          // ),

          /* Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: imageFileList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(File(imageFileList![index].path) as File, fit: BoxFit.cover,);
                  }),
            ),
        ),*/
          //Capture Location Button

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
            child: SizedBox(
              width: 190,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.red.withOpacity(0.8),

                  /*  padding: EdgeInsets.only(
                      left: 0, right: 0, top: 20, bottom: 15),*/
                ),
                onPressed: ()
                    //}
                    {

                  //loadProgress();
                  //getCurrentPosition();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyPageSecond(widget.userData!,widget.username,widget.token)));


                  //_showLatLongText();
                  //requestLocationPermission();
                  //_getCurrentPosition();
                },
                child: const Text(
                  'Capture Location',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),

          Visibility(
              /*  maintainSize: true,
              maintainAnimation: true,
              maintainState: true,*/
              visible: visible,
              child: Center(
                child: Container(
                    // margin: EdgeInsets.only(top: 50, bottom: 30),
                    child: CircularProgressIndicator()),
              )),

          /*Container(
            alignment: Alignment.topCenter,
            child: Center(
              child: Center(
                  child: CircularProgressIndicator(),
                )),
          ),*/

          Visibility(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
              child: Text(
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red.withOpacity(0.8),
                      fontFamily: 'RobotoBold',
                      fontWeight: FontWeight.bold),
                  "Latitude: " + latitude + "," + " Longitude: " + longitude),
            ),
            visible: _visible,
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          //Add Remarks Text
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
            child: Text(
              "Add Remarks",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: TextField(
              controller: remarkController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          //Save,Submit Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.red.withOpacity(0.8),
                ),

                onPressed: () async {
                  EUCForm user = EUCForm.empty();
                  user.scheme = schemeController.text.toString();
                  user.fy = fyController.text.toString();
                  user.expenditure = expenditureController.text.toString();
                  user.latitude = "jgh";
                  user.longitude = "jgjgj";
                  user.remark = remarkController.text.toString();

                  var result = await dbHandler.insertUser(user);
                  /*  initState();
              setState(() {
              });*/
                  print(result);
                  if (result >= 1) {
                    Fluttertoast.showToast(
                        msg: "Data Saved Success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Data Not Inserted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow);
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 30,
              ),




              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.red.withOpacity(0.8),
                ),

                onPressed: () {
                  if (imageFile == null) {
                    Fluttertoast.showToast(
                      msg: "Please select image",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                  } else if (latitude == null && longitude == null) {
                    Fluttertoast.showToast(
                      msg: "Location not available. Please fetch Location",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                  }
                  else {
                    _startLoading();


                    print("stringval" + stringValue);
                    //print("photo"+_base64String);
                    print("latitude" + latitude);
                    print("longitude" + longitude);





                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      // Permission granted, access the device's location.
      _getLocation();
    } else if (status.isDenied) {
      // Permission denied, show a message to the user.
      print('Location permission denied');
    }
  }

  Future<void> _getLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      // Permission granted, open the camera.
      _controller.initialize();

      //    if (_imageList.length < 2) {
      _getFromCamera();
      //  } else {
      //  showToast();
      //}
    } else if (status.isDenied) {
      // Permission denied, show a message to the user.
      print('Camera permission denied');
    }
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'You cannot add more than 2 images',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  void getCurrentPosition() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        visible = false;
        _visible = !_visible;
        latitude = currentPosition.latitude.toString();
        longitude = currentPosition.longitude.toString();
      });
      print("Latitude" + currentPosition.latitude.toString());
      print("Longitude" + currentPosition.longitude.toString());
      // showToast();

      Fluttertoast.showToast(
          msg: '' + currentPosition.longitude.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  /// Get from Camera

  _getFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile = File(image!.path);

    final filePath = imageFile!.absolute.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.png|.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      filePath,
      outPath,
      //Save the compressed image with the same file name
      quality: 20, // Adjust the quality (0-100) as needed
    );

    final Uint8List imagebytes = await compressedImage!.readAsBytes();

    setState(() {
      _base64Image = base64.encode(imagebytes);
      imageFile;
    });

    //  _addImage(imageFile!!);
    /* setState(() {
       imageFile;
       image;
     });*/
  }

  void _addImage(File _image) {
    setState(() {
      _imageList.add(_image);
    });
  }


  Future<void> sendRequest(int i, String username, String photonew,

      String latitude, String longitude, String imei) async {


    final String url =
        'http://3.93.237.74/pfms/storedata.php'; // Replace with your API endpoint

    try {
      String locationnew = widget.locationList.toString();
      final Map<String, dynamic> requestBody = {
        'username': widget.username,
        'token': widget.token,
        'photo': photonew,
        'device_id': imei,
        'latitude': "23.76",
        'longitude': "44.65",
        'euc_id': widget.userData!.eucId,
        'euc_status': "1",
        'amount': widget.userData!.unspentBalance,
        'state_code':widget.userData!.state_code,
        'dist_code':widget.userData!.dist_code,
        'location':locationnew
      };

      final String jsonBody = jsonEncode(requestBody);
      final response = await http.post(
        Uri.parse(url),
        body: jsonBody,
      );

     // Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isLoading = false;
        });
      //});

      print("Login response" + response.body);

      SubmitModel submitModel= submitFromJson(response.body);

     String status=submitModel.status!;

     if(status=="Success")
    {

      String successmessage =   submitModel.message!;

      Fluttertoast.showToast(
      msg: ''+successmessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.yellow
  );


    }
  else
    {
      String failedmessage =   submitModel.message!;

      Fluttertoast.showToast(
          msg: ''+failedmessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );
    }

    } catch (e)
    {
      print('Error sending POST request: $e');
      Fluttertoast.showToast(
          msg: ''+e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );





    }
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      print("lat123" + _currentPosition!.latitude.toString());
      print("long123" + _currentPosition!.longitude.toString());
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getEncodedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('encodedImage');
    // return stringValue;

    encodeImage = stringValue;

    /* Fluttertoast.showToast(
        msg: 'Name Saved Successfully'+stringValue!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );*/
  }


  void _startLoading() {
    setState(() {
      isLoading = true;
    });

    i++;
    String deviceId = androidInfo.androidId;
    sendRequest(i, stringValue, _base64Image!, latitude,
        longitude, deviceId);
  }

   /*compressBase64Image(String base64Image)  {
    List<int> compressedBytes =  FlutterImageCompress.compressWithList(
      base64Decode(base64Image),
    );
    return base64Encode(compressedBytes);
  }*/
}
