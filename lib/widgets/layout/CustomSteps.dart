import 'package:flutter/material.dart';

class CustomSteps extends StatefulWidget {
  final String stepNo;
  const CustomSteps({super.key, required this.stepNo});

  @override
  State<CustomSteps> createState() => _CustomStepsState();
}

class _CustomStepsState extends State<CustomSteps> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.stepNo,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Abhaya Libre',

      ),);

  }
}
