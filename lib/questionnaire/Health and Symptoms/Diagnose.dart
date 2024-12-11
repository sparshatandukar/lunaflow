import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';
import '../../widgets/layout/CustomQuest.dart';
import '../../widgets/layout/CustomStepNo.dart';

class Diagnose extends StatefulWidget {
  const Diagnose({super.key});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  final List<String> activityLevels = [
    'PCOS',
    'Endomertriosis',
    'others',
  ];
  String? selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Customstepno(stepNo: "Step 3: Health and Symptoms"),
              const SizedBox(height: 20),

              // Step Header with Progress Indicator Only
              const CustomSteps(
                currentStep: 3,
                totalSteps: 4,
              ),
              const SizedBox(height: 20),

              const Customquest(
                  quest:
                      "Do you have any diagnosed health conditions? (Optional)"),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
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
              ),

              Center(
                child: ElevatedButton(
                  onPressed: selectedActivityLevel == null
                      ? null // Disable button if no activity level is selected
                      : () {
                          // Handle "Next" button functionality
                          print(
                              "Selected Activity Level: $selectedActivityLevel");
                          // Navigate to the next screen or perform actions here
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFB8B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
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
