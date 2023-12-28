import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/helper/classify_image.dart';
import 'package:plant_app/pages/home_page.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ImageClassificaion().loadModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData || snapshot.connectionState == ConnectionState.done) {
            return const MyHomePage(title: "Plant Identity");
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: KprimaryColor,
              ),
            );
          }
        });
  }
}
