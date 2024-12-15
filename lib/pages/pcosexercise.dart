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
                'The Cobra Pose',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'image/pcos_exercise1.png',
                username: 'Alupage',
                description: 'The Cobra Pose (Bhujangasana) is a gentle backbend yoga pose where you lie face down, place your palms under your shoulders, and lift your chest while keeping your lower body grounded. It is highly beneficial for women with PCOS (Polycystic Ovary Syndrome) as it promotes hormonal balance, stimulates the reproductive organs, and reduces stress.',
              ),
              SizedBox(height: 32),
              Text(
                'The Butterfly Pose',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'image/pcos_exercise2.png',
                username: 'Alupage',
                description: 'The Butterfly Pose (Baddha Konasana) is excellent for PCOS as it stimulates the reproductive organs, improves blood circulation in the pelvic region, and promotes hormonal balance. How to Do: Sit on the floor with your back straight. Bring the soles of your feet together, letting your knees fall outward. Hold your feet with your hands and gently flap your knees up and down like butterfly wings. Breathe deeply and continue for 1–2 minutes. ',
              ),
              SizedBox(height: 32),
              Text(
                'Planks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FoodCard(
                imageUrl: 'image/pcos_exercise3.png',
                username: 'Samira',
                description: 'Planks are highly beneficial for women with PCOS as they strengthen the core, improve metabolism, and aid in weight management, which is crucial for managing symptoms. Benefits of Planks for PCOS Core Strength: Builds abdominal muscles, which can support hormonal balance. Improves Insulin Sensitivity: Regular practice helps with blood sugar regulation. Weight Loss: Boosts metabolism and burns calories effectively. ',
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