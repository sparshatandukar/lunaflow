import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final List<String> activityLevels = [
    'Track my period',
    'Manage PCOS symptoms',
    'Relieve period pain',
    'Learn more about menstrual health',
    'Improve mental well-being',
  ];

  final List<String> selectedActivityLevels = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              const Customstepno(stepNo: "Step 4: Goals and Preferences"),
              const SizedBox(height: 50),

              // Step Header with Progress Indicator Only
              const CustomSteps(
                currentStep: 1,
                totalSteps: 2,
              ),
              const SizedBox(height: 50),

              const Customquest(
                  quest:
                  "What are your main goals for using Luna Flow? (Select all that apply)"),
              const SizedBox(height: 50),

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
                    Navigator.pushNamed(
                      context,
                      '/preference',
                      arguments: {
                        ...args,  // Spread the existing arguments
                        'selectedGoals': selectedActivityLevels, // Pass selected goals
                      },
                    );
                  },  // Pass the selected goals to the next page


                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFB8B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
      ),
    );
  }
}
