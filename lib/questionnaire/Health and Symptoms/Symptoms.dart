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
  final List<String> activityLevels = [
    'Painful cramps',
    'Heavy bleeding',
    'Bloating',
    'Fatigue',
    'Mood swings',
  ];

  final List<String> selectedActivityLevels = []; // For multiple selections

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Customstepno(stepNo: "Step 3: Health and Symptoms"),
            const SizedBox(height: 50),

            // Step Header with Progress Indicator Only
            const CustomSteps(
              currentStep: 2,
              totalSteps: 3,
            ),
            const SizedBox(height: 50),

            const Customquest(
                quest:
                    "Do you experience severe period symptoms? (Select all that apply)"),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: activityLevels.map((level) {
                  return CheckboxListTile(
                    title: Text(level),
                    value: selectedActivityLevels.contains(level),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedActivityLevels.add(level);
                        } else {
                          selectedActivityLevels.remove(level);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: selectedActivityLevels.isEmpty
                    ? null // Disable button if no symptoms are selected
                    : () {
                        // Handle "Next" button functionality
                        print("Selected Symptoms: $selectedActivityLevels");
                        // Navigate to the next screen or perform actions here
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEFB8B8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
