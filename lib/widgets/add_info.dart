import 'package:flutter/material.dart';

class AddInfo extends StatelessWidget {
  const AddInfo(
      {super.key,
      required this.icon,
      required this.text2,
      required this.text3});
  final IconData icon;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Icon(icon), Text(text2), Text(text3)],
    );
  }
}
