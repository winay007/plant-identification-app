import 'dart:io';
// import 'dart:js_interop';

import 'package:cross_file_image/cross_file_image.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/components/name_card.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/helper/classify_image.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile ?_image;
  String name = "Pick an image";

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: openCamera,
                    child: const Text(
                      'Take a Picture',
                      style: TextStyle(
                          color: KprimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    onTap: openGallery,
                    child: const Text(
                      'Select  from Gallery',
                      style: TextStyle(
                        color: KprimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    Navigator.pop(context);

    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      String? label = await ImageClassificaion().classifyImage(image);
      setState(() {
         name = label!;
        _image = image;
      });
    }
  }

  Future openGallery() async {
    Navigator.pop(context);

    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture != null) {
      String? label = await ImageClassificaion().classifyImage(picture);
      setState(() {
         name = label!;
        _image = picture;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 255, 253, 253),
        toolbarHeight: 80,
        title: Container(
            margin: const EdgeInsets.only(
              left: 30,
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            height: 480,
            width: double.infinity,
            child: _image == null
                ? const Center(child: Text("Welcome"))
                : Image(
                    image: XFileImage(_image!),
                  ),
          ),
          Center(child: NameCard(name: name)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFFFFFFFF),
        onPressed: _optionDialogBox,
        child: const Icon(
          Icons.camera,
          size: 36,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}