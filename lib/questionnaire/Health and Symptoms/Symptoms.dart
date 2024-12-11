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
  final List<String> symptoms = [
    'Painful cramps',
    'Heavy bleeding',
    'Bloating',
    'Fatigue',
    'Mood swings',
  ];
  final List<String> selectedSymptoms = []; // For multiple selections

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
            const Customstepno(stepNo: "Step 3: Health and Symptoms"),
            const SizedBox(height: 50),
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
                children: symptoms.map((symptom) {
                  return CheckboxListTile(
                    title: Text(symptom),
                    value: selectedSymptoms.contains(symptom),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedSymptoms.add(symptom);
                        } else {
                          selectedSymptoms.remove(symptom);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: selectedSymptoms.isEmpty
                    ? null
                    : () {
                  Navigator.pushNamed(
                    context,
                    '/track',
                    arguments: {
                      ...args,
                      'severeSymptoms': selectedSymptoms,
                    },
                  );
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
