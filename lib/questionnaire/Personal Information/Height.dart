import 'package:flutter/material.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/ActivityLevel.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {

  // Generate a list of years from 1920 to 2020
  bool isMetric = true; // Toggle between Imperial and Metric
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Step Header
            const Customstepno(stepNo: "Step 1: Personal Information"),
            const CustomSteps(
              currentStep: 2,
              totalSteps: 3,
            ),
            const Customquest(
                quest: "What is your weight and height? (Optional)"),
            // Toggle for Imperial/Metric
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected: [!isMetric, isMetric],
                  onPressed: (index) {
                    setState(() {
                      isMetric = index == 1;
                      weightController.clear();
                      heightController.clear();
                    });
                  },
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: const Color(0xFFF28B81),
                  constraints:
                  const BoxConstraints(minWidth: 100, minHeight: 40),
                  children: const [
                    Text("Imperial"),
                    Text("Metric"),
                  ],
                ),
              ],
            ),
            // Input Fields for Weight and Height
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Weight:", style: TextStyle(fontSize: 18)),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: isMetric ? "kg" : "lbs",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Height:", style: TextStyle(fontSize: 18)),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: isMetric ? "cm" : "in",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Next Button
            Custombutton(
              btnName: 'Next',
              onPressed: () {
                final weight = weightController.text;
                final height = heightController.text;

                Navigator.pushNamed(
                  context,
                  '/activity', // Replace with the route to the next page
                  arguments: {
                    'userId': args['userId'], // Pass userId from the previous page
                    'checkbox1': args['checkbox1'],
                    'checkbox2': args['checkbox2'],
                    'checkbox3': args['checkbox3'],
                    'checkbox4': args['checkbox4'],
                    'selectedYear': args['selectedYear'],
                    'selectedMonth': args['selectedMonth'],
                    'weight': weight,
                    'height': height,
                    'isMetric': isMetric,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}