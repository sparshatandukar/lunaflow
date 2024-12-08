import 'package:flutter/material.dart';
import 'package:lunaflow/landing%20page/navigate.dart';
import 'package:lunaflow/landing%20page/welcomepage.dart';
import 'package:lunaflow/landing%20page/welcometo.dart';
import 'package:lunaflow/questionnaire/Goals%20and%20Preferences/Goals.dart';
import 'package:lunaflow/questionnaire/Menstural%20Cycle%20Details/FirstDay.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Age.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Height.dart';
import 'package:lunaflow/page/dashboard.dart';
// import 'package:lunaflow/page/loginpage.dart';
// import 'package:lunaflow/page/privacy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Goals(),
    );
  }
}
