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
    return Center(
      child: Text(
        widget.quest,
        style: const TextStyle(
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
