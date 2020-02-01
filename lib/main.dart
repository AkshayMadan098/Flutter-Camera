import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
main(){
  runApp(MaterialApp (home:MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;
            

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camera App",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Camera App"),
          
        ),
        body: Center(
          child: _image==null?
          Text("No image selected") 
          :Image.file(_image),
              
          
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: (){
            _neverSatisfied();
                      },
                    ),
                  ),
                );
              }
                  Future  opencamera() async {
               var image= await ImagePicker.pickImage(source: ImageSource.camera);

               setState(() {
                 _image=image;
               });
 }
        Future  opengallery() async {
               var image= await ImagePicker.pickImage(source: ImageSource.gallery);

               setState(() {
                 _image=image;
               });
 }
 Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose Image or gallery'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
              child: Text('Chooose Camera'),
              onTap: opencamera,
              
              ),
              GestureDetector(
              child: Text('Chooose Gallery'),
              onTap: opengallery,
              
              
          )],
        ),
        ),
      );
    },
  );
}

}