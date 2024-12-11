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
                      print("Selected Activity Level: $selectedActivityLevel");
                      // Navigate to the next screen or perform actions here
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
