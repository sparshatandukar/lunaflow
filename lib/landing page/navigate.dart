import 'package:flutter/material.dart';
import 'package:lunaflow/authentication/login.dart';
import 'package:lunaflow/authentication/signup.dart';

import 'package:lunaflow/widgets/layout/CustomButton.dart';

class navigate extends StatefulWidget {
  const navigate({super.key});

  @override
  State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/luna.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),
            Custombutton(
              btnName: 'Login',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
            const SizedBox(height: 10),
            Custombutton(
              btnName: 'Sign up',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}