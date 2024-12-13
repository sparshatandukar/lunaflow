
import 'package:flutter/material.dart';

class Pcoslifestyle extends StatefulWidget {
  const Pcoslifestyle({super.key});

  @override
  State<Pcoslifestyle> createState() => _PcoslifestyleState();
}

class _PcoslifestyleState extends State<Pcoslifestyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifestyle for PCOS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SizedBox(height: 16),
            Text(
              'Adopting a healthy lifestyle can help manage PCOS symptoms. Stay active, manage stress, and maintain a balanced routine.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'assets/dietspinach.jpg',
              username: 'Samira',
              description: 'Stress management through yoga and meditation.',
            ),
            SizedBox(height: 16),
            Text(
              'Adopting a healthy lifestyle can help manage PCOS symptoms. Stay active, manage stress, and maintain a balanced routine.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'assets/dietspinach.jpg',
              username: 'Samira',
              description: 'Stress management through yoga and meditation.',
            ),
          ],
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
