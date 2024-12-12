import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth.dart';
import '../services/period_logs.dart';
import '../services/user_model.dart';

class CyclePage extends StatefulWidget {
  const CyclePage({super.key});

  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  List<String> symptoms = [];
  String mood = '';
  DateTime? selectedDate;
  DateTime nextPeriod = DateTime.now();
  bool isLoader = false;

  Future<void> fetchUserData() async {
    try {
      setState(() {
        isLoader = true;
      });
      final user = Provider.of<UserModel?>(context, listen: false);
      final nextPeriodDate = await AuthService().getNextPeriodDate(user!.uid);

      setState(() {
        isLoader = false;
        nextPeriod = nextPeriodDate ?? DateTime.now();
      });
    } catch (e) {
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoader
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
      backgroundColor: const Color(0xFFFDF8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F6),
        elevation: 0,
        title: const Text(
          'Period Tracker',
          style:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

            Row(
              children: [
                const Text(
                  'Last Period :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  DateFormat('dd MMM yyyy').format(nextPeriod),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 15,),
          if (selectedDate != null)
            Text(
              "Selected Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                'image/sad.png',
                'image/angry.png',
                'image/neutral.png',
                'image/amaze.png',
                'image/amaze.png',
              ];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    mood = moods[index];
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: mood == moods[index]
                          ? Colors.blueAccent
                          : colors[index],
                      foregroundImage: AssetImage(images[index]),
                      radius: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      moods[index],
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
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
              final symptomsList = ['All Good', 'Headache', 'Cramps', 'Acne'];
              final image = [
                'image/happy-face.png',
                'image/headache.png',
                'image/stomach.png',
                'image/acne.png',
              ];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (symptoms.contains(symptomsList[indexs])) {
                      symptoms.remove(symptomsList[indexs]);
                    } else {
                      symptoms.add(symptomsList[indexs]);
                    }
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: symptoms.contains(symptomsList[indexs])
                          ? Colors.pinkAccent
                          : Colors.pink[100],
                      foregroundImage: AssetImage(image[indexs]),
                      radius: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      symptomsList[indexs],
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              setState(() {

                isLoader=true;
              });
              final user = Provider.of<UserModel?>(context, listen: false);
              if (user != null) {
                final date = selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                    : DateFormat('yyyy-MM-dd').format(DateTime.now());

                await PeriodLogs().savePeriodLogs(
                  userId: user.uid,
                  date: date,
                  mood: mood,
                  symptoms: symptoms,
                );
                setState(() {

                  isLoader=false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Period log updated!')),
                );
                Navigator.pushReplacementNamed(context, '/dashboard');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(238, 160, 156, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


