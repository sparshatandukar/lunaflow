import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class FirstDay extends StatefulWidget {
  const FirstDay({super.key});

  @override
  State<FirstDay> createState() => _FirstDayState();
}

class _FirstDayState extends State<FirstDay> {
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
              currentStep: 1,
              totalSteps: 4,
            ),
            Customquest(quest: "When was the first day of your last period?"),
          ],
        ),
      ),
    );
  }
}
