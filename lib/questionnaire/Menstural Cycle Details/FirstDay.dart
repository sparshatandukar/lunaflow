import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:intl/intl.dart'; // For date formatting

class FirstDay extends StatefulWidget {
  const FirstDay({super.key});

  @override
  State<FirstDay> createState() => _FirstDayState();
}

class _FirstDayState extends State<FirstDay> {
  DateTime? selectedDate; // State variable to hold the selected date

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Customstepno(stepNo: "Step 2: Menstrual Cycle Details"),
                const SizedBox(height: 50),
                const CustomSteps(
                  currentStep: 1,
                  totalSteps: 4,
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Customquest(
                      quest: "When was the first day of your last period?"),
                ),
                const SizedBox(height: 50),
                // Calendar Picker
                SizedBox(
                  height: 300,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    onDateChanged: (DateTime date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Display selected date
                if (selectedDate != null)
                  Text(
                    "Selected Date: ${DateFormat.yMMMMd().format(selectedDate!)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                const SizedBox(height: 20),
                // "Next" Button
                ElevatedButton(
                  onPressed: selectedDate == null
                      ? null
                      : () {
                    Navigator.pushNamed(
                      context,
                      '/period',
                      arguments: {
                        ...args,
                        'selectedDate': selectedDate,
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
      ),
    );
  }
}
