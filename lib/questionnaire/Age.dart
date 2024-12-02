import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomSteps.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Container(
        width: double.infinity,
          child: Column(
            children: [
              CustomSteps(
                stepNo: 'Step 1: Personal Information',
              ),
            ],
          ),
      )
      ),
    );
  }
}
