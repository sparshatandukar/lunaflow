import 'package:flutter/material.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFEEA09C),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              SizedBox(width: 300, child: Tab(text: "Diet")),
              SizedBox(width: 300, child: Tab(text: "Exercise")),
              SizedBox(
                width: 300,
                child: Tab(
                  text: "Life-style",
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DietContent(),
            ExerciseContent(),
            LifestyleContent(),
          ],
        ),
      ),
    );
  }
}

class DietContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
        child: Column(
          children: const [
            SizedBox(height: 16),
            FoodCard(
              imageUrl: 'assets/dietspinach.jpg',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'assets/dietdarkchoco.jpg',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ExerciseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
        child: Column(
          children: const [
            SizedBox(height: 16),
            FoodCard(
              imageUrl: 'assets/pelvictilt.png',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'assets/kneetochest.jpg',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class LifestyleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
        child: Column(
          children: const [
            SizedBox(height: 16),
            FoodCard(
              imageUrl: 'assets/dietspinach.jpg',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 32),
            FoodCard(
              imageUrl: 'assets/dietdarkchoco.jpg',
              username: 'Samira',
              description: 'Good diet',
            ),
            SizedBox(height: 16),
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
    required this.imageUrl,
    required this.username,
    required this.description,
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.favorite_border, color: Color(0xFFEEA09C)),
                SizedBox(width: 8),
                Icon(Icons.chat_bubble_outline, color: Color(0xFFEEA09C)),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
