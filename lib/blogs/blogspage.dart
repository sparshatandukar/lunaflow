import 'package:flutter/material.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Row(
          children: [
            // Add button on the left
            GestureDetector(
              onTap: () {
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
            SizedBox(width: 10),
            // Search bar
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
            // Chat button on the right
            IconButton(
              icon: Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                print("Chat button tapped");
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Blog and PCOS buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Blog Button tapped");
                  },
                  child: Text('Blog'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print("PCOS Button tapped");
                  },
                  child: Text('PCOS'),
                ),
              ],
            ),
          ),

          // Display content based on selected tab
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

      // Bottom navigation bar with circles (no action on tap)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {}, // Empty function, no navigation on tap
        type: BottomNavigationBarType.fixed, // Fixed layout for items
        iconSize: 24, // Size of the circle icons
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.pink,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blue,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.green,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.orange,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.purple,
            ),
            label: '',
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
