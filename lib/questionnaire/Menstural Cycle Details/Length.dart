import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Customstepno(stepNo: "Step 2: Menstrual Cycle Details"),

            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 3,
              totalSteps: 4,
            ),
            Customquest(
                quest:
                    "What is the average length of your menstrual cycle (from the start of one period to the next)?"),
          ],
        ),
      ),
    );
  }
}
