import 'package:flutter/material.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Height.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Customstepno(stepNo: "Step 1: Personal Information"),

            // Step Header with Progress Indicator Only
            const CustomSteps(
              currentStep: 1,
              totalSteps: 3,
            ),
            const Customquest(quest: "What is your age?"),

            Custombutton(
              btnName: 'Next',
              onPressed: (){
                Height();
              },
            ),

          ],
        ),
      ),
    );
  }
}
