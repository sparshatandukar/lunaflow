import 'package:flutter/material.dart';

class Pcosexercise extends StatefulWidget {
  const Pcosexercise({super.key});

  @override
  State<Pcosexercise> createState() => _PcosexerciseState();
}

class _PcosexerciseState extends State<Pcosexercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise for PCOS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              Text(
                'Cardiovascular Exercises',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'assets/kneetochest.jpg',
                username: 'Samira',
                description: 'Effective exercise for stress management.',
              ),
              SizedBox(height: 32),
              Text(
                'Yoga and Mindfulness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'assets/kneetochest.jpg',
                username: 'Samira',
                description: 'Focus on relaxation and hormone regulation.',
              ),
              SizedBox(height: 32),
              Text(
                'Yoga and Mindfulness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'assets/kneetochest.jpg',
                username: 'Samira',
                description: 'Focus on relaxation and hormone regulation.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String description;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}