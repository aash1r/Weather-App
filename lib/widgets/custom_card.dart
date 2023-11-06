import 'dart:ui';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, required this.icon, required this.text1});
  final String text;
  final IconData icon;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child:  Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 33),
                ),
                const SizedBox(
                  height: 10,
                ),
                Icon(
                  icon,
                  size: 65,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}