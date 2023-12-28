import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/pages/loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Identification',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KprimaryColor),
        useMaterial3: true,
      ),
      home: const Loader(),
    );
  }
}
