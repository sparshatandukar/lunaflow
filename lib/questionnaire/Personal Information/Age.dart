import 'package:flutter/material.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Height.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';
import 'package:lunaflow/widgets/layout/CustomQuest.dart';
import 'package:lunaflow/widgets/layout/CustomStepNo.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  int? selectedYear;
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // Generate a list of years from 1920 to 2020
    List<int> years = [for (var i = 1990; i <= 2020; i++) i];

    // List of months
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Step Info and Question
              const Column(
                children: [
                  Customstepno(stepNo: "Step 1: Personal Information"),
                  SizedBox(
                    height: 80,
                  ),
                  CustomSteps(currentStep: 1, totalSteps: 3),
                  SizedBox(
                    height: 80,
                  ),
                  Customquest(quest: "What is your age?"),
                ],
              ),

              // Dropdowns for Year and Month
              Row(
                children: [
                  // Dropdown for selecting year
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: selectedYear,
                      hint: const Text("Select Year"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                      items: years.map((year) {
                        return DropdownMenuItem(
                          value: year,
                          child: Text(year.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 16.0),

                  // Dropdown for selecting month
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      hint: const Text("Select Month"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                      items: months.map((month) {
                        return DropdownMenuItem(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              // Next Button
              Custombutton(
                btnName: 'Next',
                onPressed: () {
                  if (selectedYear == null || selectedMonth == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select year and month!"),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/height', // Replace with your actual route
                      arguments: {
                        'userId': args['userId'], // Pass userId from previous page
                        'checkbox1': args['checkbox1'],
                        'checkbox2': args['checkbox2'],
                        'checkbox3': args['checkbox3'],
                        'checkbox4': args['checkbox4'],
                        'selectedYear': selectedYear,
                        'selectedMonth': selectedMonth,
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}