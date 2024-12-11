import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Irregular extends StatefulWidget {
  const Irregular({super.key});

  @override
  State<Irregular> createState() => _IrregularState();
}

class _IrregularState extends State<Irregular> {
  // Options for period duration
  String? selectedDuration;
  bool? selectedOption; // State variable for the selected duration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Customstepno(stepNo: "Step 2: Menstrual Cycle Details"),
            const SizedBox(height: 50),

            const CustomSteps(
              currentStep: 4,
              totalSteps: 4,
            ),
            const SizedBox(height: 50),

            const Customquest(quest: "Do you experience irregular periods?"),
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

            // "Next" Button
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
