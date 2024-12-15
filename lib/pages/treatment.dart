import 'package:flutter/material.dart';

class Treatment extends StatefulWidget {
  const Treatment({super.key});

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
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
                    'PCOS Treatment',
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
                    '''There is no cure for PCOS, but treatments can improve symptoms.

                        People who have irregular periods, trouble getting pregnant or excessive acne and hair growth should speak to a healthcare professional.
                        
                        Some symptoms of PCOS can be reduced through lifestyle changes. Eating a healthy diet and getting enough exercise can help reduce weight and reduce the risk of type 2 diabetes.
                        
                        Birth control medicines (contraceptive pill) can help regulate the menstrual cycle and reduce symptoms. Other medicines can reduce acne or unwanted hair growth caused by PCOS.
                        
                        Treatments for infertility due to PCOS include lifestyle changes, medicines or surgery to stimulate regular ovulation. In-vitro fertilization (IVF) may be used but it has some risks.''',
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