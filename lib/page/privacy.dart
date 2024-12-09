import 'package:flutter/material.dart';
import 'package:lunaflow/questionnaire/Personal%20Information/Age.dart';

class privacy extends StatefulWidget {
  const privacy({super.key});

  @override
  _privacyState createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  final List<bool> _checkboxValues = [false, false, false, false];

  void _acceptAll() {
    setState(() {
      for (int i = 0; i < _checkboxValues.length; i++) {
        _checkboxValues[i] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F6),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Your privacy is important to us!\nPlease review and agree to the following to continue using Luna Flow:',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildCheckbox(
                    0,
                    'I agree to the Privacy Policy and Terms of Use.',
                    '(Required: Ensures you understand how we protect and use your data.)',
                  ),
                  _buildCheckbox(
                    1,
                    'I agree to allow Luna Flow to process my personal health data for app functions.',
                    '(Required: This helps us provide accurate tracking and tailored recommendations.)',
                  ),
                  _buildCheckbox(
                    2,
                    'I agree to receive updates and recommendations from Luna Flow via email or the app.',
                    '(Optional: Stay informed about features and health tips.)',
                  ),
                  _buildCheckbox(
                    3,
                    'I agree to allow Luna Flow to collect usage data to improve app performance and services.',
                    '(Optional: Helps us create a better experience for all users.)',
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _acceptAll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFEEA09C)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Accept All',
                      style: TextStyle(color: Color(0xFFEEA09C)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Age()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE0A29E),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(int index, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: _checkboxValues[index],
            onChanged: (value) {
              setState(() {
                _checkboxValues[index] = value!;
              });
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
