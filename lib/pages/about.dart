import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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

                  // Title Text with Flexible Widget to prevent overflow
                  Flexible(
                    child: const Text(
                      'What is Polycystic Ovary Syndrome (PCOS)?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Abhaya Libre',
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis, // Adds ellipsis if text is too long
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

              // Content Section with Scrollable Text
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '''
Polycystic ovary syndrome (PCOS) is a set of symptoms caused by a problem with a woman's hormones. It affects the ovaries. These are the small organs that store a woman's eggs. But it can also affect the rest of the body. PCOS is a very common condition in women of childbearing age. In some cases, it can lead to serious health issues if not treated.

Ovulation happens when a mature egg is released from an ovary. This happens so it can be fertilized by a male sperm. If the egg is not fertilized, it is sent out of the body during your period.

In some cases, a woman doesn’t make enough of the hormones needed to ovulate. When ovulation doesn’t happen, the ovaries can develop many small fluid-filled sacs (cysts). These cysts make hormones called androgens. Androgens are a type of hormone normally found in abundance in men, but women normally have them in smaller amounts. Women with PCOS often have high levels of androgens. This can cause more problems with a woman's menstrual cycle. And it can cause many of the symptoms of PCOS.

Treatment for PCOS is often done with medicine. This can’t cure PCOS, but it helps reduce symptoms and prevent some health problems.
                        ''',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontFamily: 'Abhaya Libre',
                          color: Colors.black87,
                        ),
                      ),
                    ],
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
