import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  String? selectedDuration;
  final List<String> durations = [
    "Less than 21 days (short cycle)",
    "21-24 days",
    "25-28 days (average)",
    "29-32 days",
    "33-35 days",
    "I’m not sure",
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Customstepno(stepNo: "Step 2: Menstrual Cycle Details"),
              const SizedBox(height: 50),
              const CustomSteps(
                currentStep: 3,
                totalSteps: 4,
              ),
              const SizedBox(height: 50),
              const Customquest(
                  quest:
                  "What is the average length of your menstrual cycle (from the start of one period to the next)?"),
              const SizedBox(height: 50),
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
              ElevatedButton(
                onPressed: selectedDuration == null
                    ? null
                    : () {
                  Navigator.pushNamed(
                    context,
                    '/irregular',
                    arguments: {
                      ...args,
                      'selectedCycleLength': selectedDuration,
                    },
                  );
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
      ),
    );
  }
}
