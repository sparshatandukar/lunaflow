import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),

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
            Customquest(quest: "Do you experience severe period symptoms? (Select all that apply)"),

          ],
        ),
      ),
    );
  }
}
