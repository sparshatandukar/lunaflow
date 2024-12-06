import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Irregular extends StatefulWidget {
  const Irregular({super.key});

  @override
  State<Irregular> createState() => _IrregularState();
}

class _IrregularState extends State<Irregular> {
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
              currentStep: 4,
              totalSteps: 4,
            ),
            Customquest(quest: "Do you experience irregular periods?"),

          ],
        ),
      ),
    );
  }
}
