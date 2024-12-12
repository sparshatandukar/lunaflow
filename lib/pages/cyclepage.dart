import 'dart:ui';

import 'package:flutter/material.dart';

class CyclePage extends StatefulWidget {
  const CyclePage({super.key});

  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F6),
        elevation: 0,
        title: const Text(
          'Period Tracker',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalendarSection(),
              const SizedBox(height: 16),
              _buildLastPeriodRecord(),
              const SizedBox(height: 16),
              _buildMoodSection(),
              const SizedBox(height: 16),
              _buildSymptomsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Select Date',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // CalendarDatePicker widget
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            onDateChanged: (DateTime date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const SizedBox(height: 16),
          // Display selected date
          if (selectedDate != null)
            Text(
              "Selected Date: ${selectedDate!.toLocal()}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLastPeriodRecord() {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Last Period Record',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Oct 20 - Oct 27',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Mood',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final moods = ['Sad', 'Angry', 'Neutral', 'Good', 'Amazing'];
              final colors = [
                const Color.fromARGB(255, 104, 179, 241),
                const Color.fromARGB(255, 246, 27, 11),
                Colors.grey,
                const Color.fromARGB(255, 158, 233, 161),
                const Color.fromARGB(255, 235, 180, 99),
              ];
              final images = [
                'assets/sad.png',
                'assets/angry.png',
                'assets/neutral.png',
                'assets/amaze.png',
                'assets/amaze.png',
              ];
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: colors[index],
                    foregroundImage: AssetImage(images[index]),
                    radius: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(moods[index],
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Symptoms',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (indexs) {
              final symptoms = ['All Good', 'Headache', 'Cramps', 'Acne'];
              final image = [
                'assets/happy-face.png',
                'assets/headache.png',
                'assets/stomach.png',
                'assets/acne.png',
              ];

              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink[100],
                    foregroundImage: AssetImage(image[indexs]),
                    radius: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(symptoms[indexs],
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
