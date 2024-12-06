import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F6), // Light cream background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF6F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Hello! Valerie',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Calendar-like Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (String day in ['S', 'M', 'T', 'W', 'T', 'F', 'S'])
                      Column(
                        children: [
                          Text(day, style: const TextStyle(color: Colors.black54)),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: day == 'T' ? Colors.white : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              day == 'T' ? '15' : '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: day == 'T' ? Colors.black : Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),

                const SizedBox(height: 16),

                // Period Tracker Card
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD9D9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Period in',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '5 Days',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Edit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bottom Navigation Bar
          BottomNavigationBar(
            backgroundColor: const Color(0xFFFFF6F6),
            selectedItemColor: const Color(0xFFFF6F6F),
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb),
                label: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
