import 'package:flutter/material.dart';

class Checksymptoms extends StatefulWidget {
  const Checksymptoms({super.key});

  @override
  State<Checksymptoms> createState() => _ChecksymptomsState();
}

class _ChecksymptomsState extends State<Checksymptoms> {
  final List<List<bool>> checkboxStates = [
    [false, false, false, false],
    [false, false, false],
    [false, false],
    [false, false],
    [false, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFEEA09C)),
          onPressed: () {},
        ),
        title: const Text(
          'Check Your Symptoms',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFFAFAFA),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildQuestion(
              'How often do you get your period?',
              [
                'Every 21-35 days (Regular)',
                'Less than 21 days (Short)',
                'More than 35 days (Irregular)',
                'I skip months without a period',
              ],
              0,
            ),
            _buildQuestion(
              'How long does your period usually last?',
              [
                '3-5 days',
                '6-7 days',
                '8+ days',
              ],
              1,
            ),
            _buildQuestion(
              'Have you noticed significant weight gain in the last year?',
              [
                'Yes',
                'No',
              ],
              2,
            ),
            _buildQuestion(
              'Do you find it difficult to lose weight even with diet and exercise?',
              [
                'Yes',
                'No',
              ],
              3,
            ),
            _buildQuestion(
              'Do you experience excessive hair growth on your face, chest, or abdomen?',
              [
                'Yes',
                'No',
              ],
              4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(
      String question, List<String> options, int questionIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          ...options.asMap().entries.map((entry) {
            final int optionIndex = entry.key;
            final String option = entry.value;
            return Row(
              children: [
                Checkbox(
                  value: checkboxStates[questionIndex][optionIndex],
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxStates[questionIndex][optionIndex] =
                          value ?? false;
                    });
                  },
                  activeColor: const Color(0xFFEEA09C),
                ),
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
