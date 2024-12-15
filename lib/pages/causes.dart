import 'package:flutter/material.dart';

class Causes extends StatefulWidget {
  const Causes({super.key});

  @override
  State<Causes> createState() => _CausesState();
}

class _CausesState extends State<Causes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title Row
              Row(
                children: [
                  // Back Button Icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.red, size: 20),
                    ),
                  ),
                  const SizedBox(width: 10), // Space between icon and text

                  // Title Text
                  const Text(
                    'PCOS Causes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Abhaya Libre',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Horizontal Line
              Divider(
                color: Colors.red.withOpacity(0.5),
                thickness: 1.2,
              ),
              const SizedBox(height: 20),

              // Content
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '''
The exact cause of PCOS is unknown. There’s evidence that genetics play a role. Several other factors, most importantly obesity, also play a role in causing PCOS:
Higher levels of male hormones called androgens:
High androgen levels prevent your ovaries from releasing eggs, which causes irregular menstrual cycles. Irregular ovulation can also cause small, fluid-filled sacs to develop on your ovaries. High androgen also causes acne and excess hair growth in women and people AFAB.
Insulin resistance:
An increase in insulin levels causes your ovaries to make and release male hormones (androgens). Increased male hormones suppress ovulation and contribute to other symptoms of PCOS. Insulin helps your body process glucose (sugar) and use it for energy. Insulin resistance means your body doesn’t process insulin correctly, leading to high glucose levels in your blood. 
Not all individuals with insulin resistance have elevated glucose or diabetes, but insulin resistance can lead to diabetes. Having overweight or obesity can also contribute to insulin resistance. An elevated insulin level, even if your blood glucose is normal, can indicate insulin resistance.

Low-grade inflammation:People with PCOS tend to have chronic low-grade inflammation. Your healthcare provider can perform blood tests that measure levels of C-reactive protein (CRP) and white blood cells, which can indicate the level of inflammation in your body.
                    ''',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontFamily: 'Abhaya Libre',
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}