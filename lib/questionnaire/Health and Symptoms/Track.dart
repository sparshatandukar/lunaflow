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

            const Customstepno(stepNo: "Step 3: Health and Symptoms"),
            const SizedBox(height: 50),

            // Step Header with Progress Indicator Only
            const CustomSteps(
              currentStep: 3,
              totalSteps: 3,
            ),
            const SizedBox(height: 50),

            const Customquest(
                quest: "Do you track your mood or symptoms during your cycle?"),
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
                  title: const Text("Yes"),
                ),
                RadioListTile<bool>(
                  value: false,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  title: const Text("No"),
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
                            "Selected Option: ${selectedOption == true ? 'Yes' : 'No'}");
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
