import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lunaflow/page/blogspage.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 248, 248),
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add, color: Color(0xFFEEA09C)),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFFEEA09C)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person, color: Color(0xFFEEA09C)),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFEEA09C),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFFEEA09C),
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEA09C)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text('Blogs')),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEA09C)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text('PCOS Blogs')),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlogsPage(), // Placeholder
            PCOSContent(),
          ],
        ),
      ),
    );
  }
}

class PCOSContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/pcos.jpg', // Replace with your image path
                height: 200,
                width: 700,
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 80),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Color(0xFFEEA09C)),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.info, color: Color(0xFFEEA09C)),
                        Text('About PCOS'),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 80),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Color(0xFFEEA09C)),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.list, color: Color(0xFFEEA09C)),
                        Text('PCOS Causes'),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 80),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Color(0xFFEEA09C)),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.medical_services, color: Color(0xFFEEA09C)),
                        Text('PCOS Treatment'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'You haven\'t provided any information about symptoms commonly associated with the condition yet.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Color(0xFFEEA09C)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEA09C)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Column(
                    children: [
                      Icon(Icons.local_dining,
                          color: Color(0xFFEEA09C), size: 50),
                      Text('Diet'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEA09C)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Column(
                    children: [
                      Icon(Icons.fitness_center,
                          color: Color(0xFFEEA09C), size: 50),
                      Text('Exercise'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEA09C)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Column(
                    children: [
                      Icon(Icons.self_improvement,
                          color: Color(0xFFEEA09C), size: 50),
                      Text('Lifestyle'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'FAQ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            FAQItem(
              question: 'What is PCOS?',
              answer: 'PCOS is a hormonal disorder...',
            ),
            FAQItem(
              question: 'What are the common symptoms of PCOS?',
              answer: 'Symptoms include...',
            ),
            FAQItem(
              question: 'Can PCOS be cured?',
              answer: 'There is no cure, but...',
            ),
            FAQItem(
              question: 'How does PCOS affect fertility?',
              answer: 'PCOS can...',
            ),
            FAQItem(
              question: 'Can PCOS affect mental health?',
              answer: 'Yes, it can...',
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.question),
          trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.answer),
          ),
        Divider(),
      ],
    );
  }
}
