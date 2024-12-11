import 'package:flutter/material.dart';
import 'package:lunaflow/chat/community_chart.dart';
import 'package:lunaflow/landing%20page/welcomepage.dart';
import 'package:lunaflow/questionnaire/Goals%20and%20Preferences/Goals.dart';
import 'package:lunaflow/questionnaire/Goals%20and%20Preferences/Preferences.dart';
import 'package:lunaflow/questionnaire/Health%20and%20Symptoms/Diagnose.dart';
import 'package:lunaflow/questionnaire/Health%20and%20Symptoms/Symptoms.dart';
import 'package:lunaflow/questionnaire/Health%20and%20Symptoms/Track.dart';
import 'package:lunaflow/questionnaire/Menstural%20Cycle%20Details/FirstDay.dart';
import 'package:lunaflow/questionnaire/Menstural%20Cycle%20Details/Irregular.dart';
import 'package:lunaflow/questionnaire/Menstural%20Cycle%20Details/Length.dart';
import 'package:lunaflow/questionnaire/Menstural%20Cycle%20Details/Period.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/ActivityLevel.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Height.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luna Flow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Preferences(),
    );
  }
}
