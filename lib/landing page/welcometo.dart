import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lunaflow/landing%20page/navigate.dart';

class Welcometo extends StatefulWidget {
  const Welcometo({super.key});

  @override
  State<Welcometo> createState() => _WelcometoState();
}

class _WelcometoState extends State<Welcometo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const navigate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'image/Welcometo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}