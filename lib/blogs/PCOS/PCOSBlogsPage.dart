import 'package:flutter/material.dart';

class PCOSBlogsPage extends StatelessWidget {
  const PCOSBlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'PCOS Blogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton('Blogs', false),
                  _buildTabButton('PCOS Blogs', true),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Image Section
            Center(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Symptoms Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You haven't provided any information about symptoms commonly associated with the condition yet.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add symptoms action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF897A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Symptoms',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // FAQ Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    const Text(
                      'FAQ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildFAQItem(
                        "What is PCOS?",
                        "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder affecting women of reproductive age."),
                    _buildFAQItem(
                        "What are the common symptoms of PCOS?",
                        "Symptoms include irregular periods, weight gain, acne, excessive hair growth, and infertility."),
                    _buildFAQItem(
                        "Can PCOS be cured?",
                        "While there is no cure, lifestyle changes and treatments can help manage symptoms."),
                    _buildFAQItem(
                        "How does PCOS affect fertility?",
                        "PCOS can cause ovulation problems, but treatments are available to improve fertility."),
                    _buildFAQItem(
                        "Can PCOS affect mental health?",
                        "Yes, women with PCOS are more likely to experience anxiety and depression."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedItemColor: const Color(0xFFFF897A),
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  // Helper method for tabs
  Widget _buildTabButton(String title, bool isActive) {
    return TextButton(
      onPressed: () {
        // Tab action
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : Colors.black54,
          decoration: isActive ? TextDecoration.underline : null,
        ),
      ),
    );
  }

  // Helper method for FAQ
  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Text(
            answer,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
