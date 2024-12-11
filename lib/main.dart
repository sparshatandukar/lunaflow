import 'package:flutter/material.dart';
import 'package:lunaflow/chat/community_chart.dart';
import 'package:lunaflow/landing%20page/welcomepage.dart';
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
      home: const Activitylevel(),
    );
  }
}
