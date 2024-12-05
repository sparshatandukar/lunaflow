import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/customsteps.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 1,
              totalSteps: 3,
            ),
          ],
        ),
      ),
    );
  }
}
