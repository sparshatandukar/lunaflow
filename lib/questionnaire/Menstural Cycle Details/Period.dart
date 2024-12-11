import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Period extends StatefulWidget {
  const Period({super.key});

  @override
  State<Period> createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  String? selectedDuration; // State variable for the selected duration
  final List<String> durations = [
    "3-4 days",
    "5-6 days",
    "7+ days",
  ]; // Options for period duration

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
              currentStep: 2,
              totalSteps: 4,
            ),
            const SizedBox(height: 50),

            const Customquest(quest: "How long does your period usually last?"),
            const SizedBox(height: 50),

            // Dropdown Menu for Period Duration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
                value: selectedDuration,
                hint: const Text("Select Duration"),
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value!;
                  });
                },
                items: durations.map((duration) {
                  return DropdownMenuItem<String>(
                    value: duration,
                    child: Text(duration),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            // "Next" Button
            ElevatedButton(
              onPressed: selectedDuration == null
                  ? null // Disable button if no duration is selected
                  : () {
                      // Handle next step or logic
                      print("Selected Duration: $selectedDuration");
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
