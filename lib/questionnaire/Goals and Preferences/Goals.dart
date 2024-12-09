import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Customstepno(stepNo: "Step 4: Goals and Preferences"),

            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 1,
              totalSteps: 2,
            ),
            Customquest(
                quest:
                    "What are your main goals for using Luna Flow? (Select all that apply)"),
          ],
        ),
      ),
    );
  }
}
