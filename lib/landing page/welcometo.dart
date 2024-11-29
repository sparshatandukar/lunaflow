import 'package:flutter/material.dart';

class Welcometo extends StatefulWidget {
  const Welcometo({super.key});

  @override
  State<Welcometo> createState() => _WelcometoState();
}

class _WelcometoState extends State<Welcometo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
