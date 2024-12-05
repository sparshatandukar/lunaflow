import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class FirstDay extends StatefulWidget {
  const FirstDay({super.key});

  @override
  State<FirstDay> createState() => _FirstDayState();
}

class _FirstDayState extends State<FirstDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Step Header with Progress Indicator Only
            const CustomSteps(
              currentStep: 1,
              totalSteps: 4,
            ),
          ],
        ),
      ),
    );
  }
}
