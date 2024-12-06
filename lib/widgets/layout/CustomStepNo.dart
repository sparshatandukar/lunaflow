import 'package:flutter/material.dart';

class Customstepno extends StatefulWidget {
  final String stepNo;
  const Customstepno({super.key, required this.stepNo});

  @override
  State<Customstepno> createState() => _CustomstepnoState();
}

class _CustomstepnoState extends State<Customstepno> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.stepNo,
      style: TextStyle(
      fontSize: 30,


    ),


    );
  }
}
