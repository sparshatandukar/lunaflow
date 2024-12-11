import 'package:flutter/material.dart';
import 'package:lunaflow/services/questionnarie_db.dart';
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
  bool? selectedOption; // To track the selected radio button option

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

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
                      : () async {
                    // Prepare the data to be saved
                    final data = {
                      'userId': args['userId'],
                      'checkbox1': args['checkbox1'],
                      'checkbox2': args['checkbox2'],
                      'checkbox3': args['checkbox2'],
                      'checkbox4': args['checkbox4'],
                      'selectedYear': args['selectedYear'].toString(), // Convert int to String
                      'selectedMonth': args['selectedMonth'],
                      'weight': args['weight'].toString(),           // Convert int to String
                      'height': args['height'].toString(),           // Convert int to String
                      'isMetric': args['isMetric'],
                      'activityLevel': args['activityLevel'],
                      'date': args['selectedDate'].toString(),       // Ensure it's a String
                      'selectedDuration': args['selectedDuration'],
                      'selectedCycle': args['selectedCycleLength'],
                      'irregularPeriods': args['irregularPeriods'],
                      'diagnosedConditions': List<String>.from(args['diagnosedConditions']),
                      'severeSymptoms': List<String>.from(args['severeSymptoms']),
                      'trackMoodOrSymptoms': args['trackMoodOrSymptoms'],
                      'selectedGoals': List<String>.from(args['selectedGoals']),
                      'preference': selectedOption == true
                          ? "In-app notifications"
                          : "Email reminders", // Use the selected option for preference
                    };

                    // Print the data for debugging
                    print("Data being saved: $data");

                    // Save the data to Firestore
                    await QuestionnarieDb().saveQuestionnaire(
                      userId: data['userId'],
                      checkbox1: data['checkbox1'],
                      checkbox2: data['checkbox2'],
                      checkbox3: data['checkbox3'],
                      checkbox4: data['checkbox4'],
                      selectedYear: data['selectedYear'],
                      selectedMonth: data['selectedMonth'],
                      weight: data['weight'],
                      height: data['height'],
                      isMetric: data['isMetric'],
                      activityLevel: data['activityLevel'],
                      date: data['date'],
                      selectedDuration: data['selectedDuration'],
                      selectedCycle: data['selectedCycle'],
                      irregularPeriods: data['irregularPeriods'],
                      diagnosedConditions: data['diagnosedConditions'],
                      severeSymptoms: data['severeSymptoms'],
                      trackMoodOrSymptoms: data['trackMoodOrSymptoms'],
                      selectedGoals: data['selectedGoals'],
                      preference: data['preference'],
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Questionnaire saved successfully!")),
                    );
                    Navigator.pushReplacementNamed(context, '/login');

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
