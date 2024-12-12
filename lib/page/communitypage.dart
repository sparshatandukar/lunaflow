import 'package:flutter/material.dart';

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
          backgroundColor: Colors.pink.shade50,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'PCOS Blogs',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person, color: Colors.pink),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Blogs'),
              Tab(text: 'PCOS Blogs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Blogs Content')), // Placeholder
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
              child: Text('jdjdj'),
              // child: Image.asset(
              //   // 'assets/images/placeholder.png', // Replace with your image path
              //   // height: 150,
              // ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100, // Corrected property
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.info, color: Colors.pink),
                      Text('About PCOS'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100, // Corrected property
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.list, color: Colors.pink),
                      Text('PCOS Causes'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100, // Corrected property
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.medical_services, color: Colors.pink),
                      Text('PCOS Treatment'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'You haven\'t provided any information about symptoms commonly associated with the condition yet.',
              style: TextStyle(color: Colors.black54),
            ),
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.pink),
              onPressed: () {},
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
                answer: 'PCOS is a hormonal disorder...'),
            FAQItem(
                question: 'What are the common symptoms of PCOS?',
                answer: 'Symptoms include...'),
            FAQItem(
                question: 'Can PCOS be cured?',
                answer: 'There is no cure, but...'),
            FAQItem(
                question: 'How does PCOS affect fertility?',
                answer: 'PCOS can...'),
            FAQItem(
                question: 'Can PCOS affect mental health?',
                answer: 'Yes, it can...'),
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
