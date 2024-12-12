import 'package:flutter/material.dart';
// import 'package:lunaflow/page/blogspage.dart';
// import 'package:lunaflow/page/cyclepage.dart';
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
        home: const Dashboard());
  }
}
