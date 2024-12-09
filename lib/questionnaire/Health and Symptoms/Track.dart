import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
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
              currentStep: 3,
              totalSteps: 3,
            ),
            Customquest(
                quest: "Do you track your mood or symptoms during your cycle?"),
          ],
        ),
      ),
    );
  }
}
