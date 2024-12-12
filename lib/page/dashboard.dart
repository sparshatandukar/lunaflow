import 'package:flutter/material.dart';
import 'package:lunaflow/page/chatpage.dart';
import 'package:lunaflow/page/communitypage.dart';
import 'package:lunaflow/page/cyclepage.dart';
import 'package:lunaflow/page/insightspage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  // Define cycle data
  final List<Map<String, dynamic>> cycleData = [
    {
      'title': 'Previous cycle length',
      'value': '26 days',
      'status': 'NORMAL',
      'statusColor': Colors.green
    },
    {
      'title': 'Previous period length',
      'value': '5 days',
      'status': 'NORMAL',
      'statusColor': Colors.green
    },
    {
      'title': 'Cycle length variation',
      'value': '26-33 days',
      'status': 'REGULAR',
      'statusColor': Colors.green
    },
  ];

  // Declare pages without initializing
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Initialize _pages in initState
    _pages = [
      // Home Page Widget
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEEA09C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var day in ['S', 'M', 'T', 'W', 'T', 'F', 'S'])
                            Column(
                              children: [
                                Text(day),
                                const SizedBox(height: 8),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: day == 'T' ? Colors.white : null,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '15',
                                      style: TextStyle(
                                        color: day == 'T' ? Colors.black : null,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Period in',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '5 Days',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFEEA09C),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'My Cycle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Container(
              //   height: 300,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              // ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cycleData.length,
                itemBuilder: (context, index) {
                  final data = cycleData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(data['title'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:
                          Text(data['value'], style: TextStyle(fontSize: 16.0)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data['status'],
                            style: TextStyle(
                              color: data['statusColor'],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Icon(Icons.info_outline, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      CyclePage(), // Cycle Page widget
      InsightsPage(), // Insights Page widget
      CommunityPage(), // Community Page widget
      ChatPage(), // Chat Page widget
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F6),
        elevation: 0,
        title: const Text(
          'Hello! Valerie',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_3_sharp,
                color: Color.fromARGB(255, 232, 155, 201)),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(248, 216, 211, 100),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Cycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Chat',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 231, 100, 93),
        unselectedItemColor: Color(0xFFEEA09C),
        showUnselectedLabels: true,
      ),
    );
  }
}
