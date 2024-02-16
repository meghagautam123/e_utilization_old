import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CameraDemo extends StatefulWidget {
  @override
  State<CameraDemo> createState() => CameraDemoState();

}

class CameraDemoState extends State<CameraDemo> {
 File? imageFile;
 List<File> _imageList = [];

 void showToast() {
   Fluttertoast.showToast(
       msg: 'You cannot add more than 2 images',
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.yellow
   );
 }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body:/* Container(*/
          /*  child: imageFile == null
                ?*/ Container(
            //  alignment: Alignment.center,
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*ElevatedButton(
                   // color: Colors.greenAccent,
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  ),*/
                  Container(
                    height: 20.0,
                  ),

                  ElevatedButton(
                    //color: Colors.lightGreenAccent,
                    onPressed: ()
                    {
                            if(_imageList.length<2) {

                        _getFromCamera();

                      }
                      else
                      {
                        showToast();
                      }







                    },
                    child: Text("PICK FROM CAMERA"),
                  ),

                  if(_imageList.isNotEmpty)
//if(_imageList.length)
                  /*Container( child: Image.file(
                  imageFile!!, width: 200,
                   height: 200))*/



              /*    Expanded(
                    child:*/
                    Container(width:400,height:150,child:
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: _imageList.length,
                        itemBuilder: (context, index) {

                        return InkWell(
                              onTap: () {
                                return null;
                              },
                              child: Card(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: /*Text(_imageList[index].path),*/
                                   Image.file(_imageList[index] )

                                  ),

                                ),
                              ));
                        }),
                  ),









                ],
              ),


            )/*: Container(
              child: Image.file(
                imageFile!!,
               width: 200,
                height: 200,
              ),
            )
    */


    //)


    );
  }

 /// Get from gallery
 _getFromGallery() async {
  final image = await ImagePicker().pickImage(
     source: ImageSource.gallery);

 //  );
  /* if (image != null) {
     setState(() {
       imageFile = XFile(image.path);
     });
   }*/
 }

 /// Get from Camera
 _getFromCamera() async {
  final image = await ImagePicker().pickImage(
     source: ImageSource.camera);

  imageFile=File(image!.path);
  _addImage(imageFile!!);

 }

 void _addImage(File _image) {
   setState(() {
     _imageList.add(_image);
   });
 }
}
