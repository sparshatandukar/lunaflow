
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
              'Stress Management:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'image/pcos_lifestyle1.png',
              username: 'Alupage',
              description: 'Practice relaxation techniques such as deep breathing, meditation, or journaling. Engage in hobbies and activities that bring joy and reduce anxiety. ',
            ),
            SizedBox(height: 16),
            Text(
              'Regular Sleep',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'image/pcos_lifestyle2.png',
              username: 'Alupage',
              description: 'Aim for 7–9 hours of quality sleep each night. Establish a consistent sleep-wake schedule. Avoid screen time at least an hour before bed to improve sleep hygiene. ',
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
