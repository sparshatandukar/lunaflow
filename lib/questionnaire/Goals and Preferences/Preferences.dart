import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  String? selectedDuration;
  bool? selectedOption; //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Customstepno(stepNo: "Step 4: Goals and Preferences"),
            const SizedBox(height: 50),

            // Step Header with Progress Indicator Only
            const CustomSteps(
              currentStep: 2,
              totalSteps: 2,
            ),
            const SizedBox(height: 50),

            const Customquest(
                quest: "How would you prefer to receive updates and tips?"),
            const SizedBox(height: 50),

            Column(
              children: [
                RadioListTile<bool>(
                  value: true,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  title: const Text("In-app notifications"),
                ),
                RadioListTile<bool>(
                  value: false,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  title: const Text("Email reminders"),
                ),
              ],
            ),

            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: selectedOption == null
                    ? null // Disable button if no option is selected
                    : () {
                        // Handle navigation to the next step
                        print(
                            "Selected Option: ${selectedOption == true ? 'In-app notifications' : 'Email reminders'}");
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
          ],
        ),
      ),
    );
  }
}
