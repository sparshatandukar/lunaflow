import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Diagnose extends StatefulWidget {
  const Diagnose({super.key});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Customstepno(stepNo: "Step 3: Health and Symptoms"),

            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 1,
              totalSteps: 3,
            ),
            Customquest(
                quest:
                    "Do you have any diagnosed health conditions? (Optional)"),
          ],
        ),
      ),
    );
  }
}
