import 'package:flutter/material.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  // For controlling the TabBar or PageView
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // Function to change the selected index
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Row(
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
            SizedBox(width: 10), // Add space between the add button and the search bar
            // Search Bar beside the Add button
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
            // Chat icon on the right side
            IconButton(
              icon: Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                // Handle chat icon action here
                print("Chat button tapped");
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Buttons for Blog and PCOS
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _onTabTapped(0); // Navigate to Blog section
                  },
                  child: Text('Blog'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _onTabTapped(1); // Navigate to PCOS section
                  },
                  child: Text('PCOS'),
                ),
              ],
            ),
          ),

          // The content display based on button selection
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                // Blog content
                SingleChildScrollView(
                  child: Column(
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

                // PCOS content
                SingleChildScrollView(
                  child: Column(
                    children: [
                      BlogCard(
                        imageUrl: 'https://via.placeholder.com/150',
                        description: 'PCOS Treatment 1',
                      ),
                      BlogCard(
                        imageUrl: 'https://via.placeholder.com/150',
                        description: 'PCOS Treatment 2',
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
