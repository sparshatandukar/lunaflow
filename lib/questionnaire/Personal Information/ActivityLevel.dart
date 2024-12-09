import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Activitylevel extends StatefulWidget {
  const Activitylevel({super.key});

  @override
  State<Activitylevel> createState() => _ActivitylevelState();
}

class _ActivitylevelState extends State<Activitylevel> {
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
              currentStep: 3,
              totalSteps: 3,
            ),
            Customquest(quest: "What is your activity level?"),
          ],
        ),
      ),
    );
  }
}
