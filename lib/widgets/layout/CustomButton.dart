import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  final String btnName;
  final VoidCallback onPressed;

  const Custombutton(
      {super.key, required this.btnName, required this.onPressed});

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEEA09C), // Background color
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        minimumSize: const Size(160, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(widget.btnName),
    );
  }
}
