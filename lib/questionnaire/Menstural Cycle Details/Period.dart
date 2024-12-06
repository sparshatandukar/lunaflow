import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Period extends StatefulWidget {
  const Period({super.key});

  @override
  State<Period> createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Customstepno(stepNo: "Step 2: Menstrual Cycle Details"),

            // Step Header with Progress Indicator Only
            CustomSteps(
              currentStep: 2,
              totalSteps: 4,
            ),
            Customquest(quest: "How long does your period usually last?"),

          ],
        ),
      ),
    );
  }
}
