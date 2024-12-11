import 'package:flutter/material.dart';

class Customquest extends StatefulWidget {
  final String quest;
  const Customquest({super.key, required this.quest});

  @override
  State<Customquest> createState() => _CustomquestState();
}

class _CustomquestState extends State<Customquest> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.quest,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}