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
  // State variables to track checkbox selections
  List<String> activityLevels = [
    'Sedentary',
    'Lightly active',
    'Moderately active',
    'Very active'
  ];
  String? selectedActivityLevel; // To store the selected option

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Customstepno(stepNo: "Step 1: Personal Information"),
            const CustomSteps(
              currentStep: 3,
              totalSteps: 3,
            ),
            const Customquest(quest: "What is your activity level?"),
            // Activity level options as checkboxes
            Column(
              children: activityLevels.map((level) {
                return CheckboxListTile(
                  title: Text(level),
                  value: selectedActivityLevel == level,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedActivityLevel = value == true ? level : null;
                    });
                  },
                );
              }).toList(),
            ),
            // "Next" button
            ElevatedButton(
              onPressed: selectedActivityLevel == null
                  ? null // Disable button if no activity level is selected
                  : () {
                // Handle "Next" button functionality
                Navigator.pushNamed(
                  context,
                  '/first_day',
                  arguments: {
                    'userId': args['userId'],
                    'checkbox1': args['checkbox1'],
                    'checkbox2': args['checkbox2'],
                    'checkbox3': args['checkbox3'],
                    'checkbox4': args['checkbox4'],
                    'selectedYear': args['selectedYear'],
                    'selectedMonth': args['selectedMonth'],
                    'weight': args['weight'],
                    'height': args['height'],
                    'isMetric': args['isMetric'],
                    'activityLevel': selectedActivityLevel,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEFB8B8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
