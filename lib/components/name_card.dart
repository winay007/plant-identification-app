import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class NameCard extends StatelessWidget {
  NameCard({required this.name});
  final String name;
  // final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 252, 251, 251),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
            child: Text(
              name,
              style: const TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
