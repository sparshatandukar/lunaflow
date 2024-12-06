import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Customstepno(stepNo: "Step 1: Personal Information"),

            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 2,
              totalSteps: 3,
            ),
            Customquest(quest: "What is your weight and height? (Optional)"),


          ],
        ),
      ),
    );
  }
}
