import 'package:flutter/material.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add button on the left side
            GestureDetector(
              onTap: () {
                // Handle add button action here
                print("Add button tapped");
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.pink,
                  size: 20,
                ),
              ),
            ),
            // Blogs title in the center
            Expanded(
              child: Center(
                child: Text(
                  'Blogs',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // Search icon on the right side
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Handle search icon action here
                print("Search button tapped");
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text('Diet')),
                Chip(label: Text('Exercise')),
                Chip(label: Text('Life-style')),
              ],
            ),
          ),
          // Blog list
          Expanded(
            child: ListView(
              children: [
                BlogCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  description: 'Good diet',
                ),
                BlogCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  description: 'Healthy eating',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String description;

  BlogCard({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
