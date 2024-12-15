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
  bool? tracksMoodOrSymptoms; // To store the user's response

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              const Customquest(quest: "Do you track your mood or symptoms during your cycle?"),
              const SizedBox(height: 40),
              // Yes/No radio buttons
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Yes"),
                      value: true,
                      groupValue: tracksMoodOrSymptoms,
                      onChanged: (bool? value) {
                        setState(() {
                          tracksMoodOrSymptoms = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("No"),
                      value: false,
                      groupValue: tracksMoodOrSymptoms,
                      onChanged: (bool? value) {
                        setState(() {
                          tracksMoodOrSymptoms = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // "Next" button to navigate to the next page
              ElevatedButton(
                onPressed: tracksMoodOrSymptoms == null
                    ? null // Disable button if no option is selected
                    : () {
                  Navigator.pushNamed(
                    context,
                    '/goal',
                    arguments: {
                      ...args,
                      'trackMoodOrSymptoms': tracksMoodOrSymptoms,

                    },

                  );
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
