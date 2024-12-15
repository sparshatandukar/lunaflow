import 'package:flutter/material.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: Icon(Icons.person_2, size: 30, color: Color(0xFFEEA09C)),
        title: Center(
          child: Text(
            '19 December',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.calendar_month, size: 30, color: Color(0xFFEEA09C)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFFAFAFA),
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildCard(
                'Diet Insights',
                'Add more protein and fiber to meals to reduce sugar cravings.',
                Icons.restaurant),
            _buildCard(
                'Diet Insights',
                'Drink herbal teas like spearmint to naturally manage hormonal balance.',
                Icons.local_cafe),
            _buildCard(
                'Exercise Insights',
                'Strength training twice a week can help improve insulin sensitivity.',
                Icons.fitness_center),
            _buildCard(
                'Exercise Insights',
                'Stretching exercises can relieve muscle tension during PMS.',
                Icons.accessibility_new),
            _buildCard(
                'Self-care Insights',
                'Practice mindfulness or meditation to lower stress levels.',
                Icons.self_improvement),
            _buildCard(
                'Self-care Insights',
                'Get 7-8 hours of sleep to help regulate cortisol levels.',
                Icons.bedtime),
            _buildCard(
                'Hormonal Insights',
                'Include cinnamon in your diet to support insulin sensitivity.',
                Icons.spa),
            _buildCard(
                'Hormonal Insights',
                'Add zinc-rich foods like pumpkin seeds for better hormonal balance.',
                Icons.eco),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String description, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFFEEA09C), size: 32),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}