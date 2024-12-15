import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../services/auth/auth.dart';

// BlogsPage Implementation
class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  List<Map<String, dynamic>> _blogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  Future<void> fetchBlogs() async {
    try {
      List<Map<String, dynamic>> blogs = await AuthService().getBlogs();
      setState(() {
        _blogs = blogs;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint("Error fetching blogs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEEA09C),
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
            BlogCategoryContent(category: "Diet", blogs: _blogs),
            BlogCategoryContent(category: "Exercise", blogs: _blogs),
            BlogCategoryContent(category: "Lifestyle", blogs: _blogs),
          ],
        ),
      ),
    );
  }
}

class BlogCategoryContent extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> blogs;

  const BlogCategoryContent({super.key, required this.category, required this.blogs});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.7, // Limit the height of the list
              child: ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FoodCard(blog: blogs[index], screenWidth: screenWidth),
                      if (index != blogs.length - 1)
                        const SizedBox(height: 16), // Add spacing between cards
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FoodCard Widget
class FoodCard extends StatelessWidget {
  final Map<String, dynamic> blog;
  final double screenWidth;

  const FoodCard({super.key, required this.blog, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final base64Image = blog['blog']['image'] ?? '';
    Uint8List? imageBytes;

    if (base64Image.isNotEmpty) {
      try {
        imageBytes = base64Decode(base64Image);
      } catch (e) {
        debugPrint("Error decoding Base64: $e");
        imageBytes = null;
      }
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: imageBytes != null
                ? Image.memory(
              imageBytes,
              fit: BoxFit.cover,
              width: double.infinity,
              height: screenWidth * 0.5,
            )
                : Image.asset(
              'image/pcos.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: screenWidth * 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.favorite_border, color: Color(0xFFEEA09C)),
                const SizedBox(width: 8),
                const Icon(Icons.chat_bubble_outline, color: Color(0xFFEEA09C)),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog['user']['email'],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        blog['blog']['desc'],
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
