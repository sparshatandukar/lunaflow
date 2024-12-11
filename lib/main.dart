import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lunaflow/authentication/login.dart';
import 'package:lunaflow/authentication/signup.dart';
import 'package:lunaflow/blogs/blogspage.dart';
import 'package:lunaflow/landing%20page/navigate.dart';
import 'package:lunaflow/landing%20page/welcomepage.dart';
import 'package:lunaflow/landing%20page/welcometo.dart';
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
import 'package:lunaflow/questionnaire/Personal%20Information/Age.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Height.dart';
import 'package:lunaflow/services/auth/auth.dart';
import 'package:lunaflow/services/user_model.dart';

import 'authentication/privacy.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const WelcomePage(),

          //authentication routes
          '/sign_up': (context) => const SignUp(),
          '/privacy': (context) => const Privacy(),
          '/age': (context) => const Age(),
          '/height': (context) => const Height(),
          '/activity': (context) => const Activitylevel(),
          '/first_day': (context) => const FirstDay(),
          '/period': (context) => const Period(),
          '/length': (context) => const Length(),
          '/irregular': (context) => const Irregular(),
          '/diagnose': (context) => const Diagnose(),
          '/symptom': (context) => const Symptoms(),
          '/track': (context) => const Track(),
          '/goal': (context) => const Goals(),
          '/preference': (context) => const Preferences(),
          '/login': (context) => const Login(),
        },
      ),
    );
  }
}
