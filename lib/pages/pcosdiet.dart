import 'package:flutter/material.dart';
import 'package:lunaflow/pages/pcosexercise.dart';
import 'package:lunaflow/pages/pcoslifestyle.dart';


class Pcosdiet extends StatelessWidget {
  const Pcosdiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet for PCOS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pcoslifestyle()),
                    );
                  },
                  child: const Text('Lifestyle'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pcosexercise()),
                    );
                  },
                  child: const Text('Exercise'),
                ),
              ],
            ),
          ),
          // Diet Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 16.0),
                child: Column(
                  children: const [
                    FoodCard(
                      imageUrl: 'assets/dietspinach.jpg',
                      username: 'Samira',
                      description:
                      'Leafy greens like spinach are excellent for PCOS.',
                    ),
                    SizedBox(height: 32),
                    FoodCard(
                      imageUrl: 'assets/dietdarkchoco.jpg',
                      username: 'Samira',
                      description:
                      'Dark chocolate is a healthy treat rich in magnesium.',
                    ),
                    SizedBox(height: 32),
                    FoodCard(
                      imageUrl: 'assets/dietdarkchoco.jpg',
                      username: 'Samira',
                      description:
                      'Dark chocolate is a healthy treat rich in magnesium.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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