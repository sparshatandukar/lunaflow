import 'package:flutter/material.dart';
import 'package:lunaflow/pages/communitypage.dart';
import 'package:lunaflow/pages/cycle_page.dart';
import 'package:lunaflow/pages/dashboard.dart';
import 'package:lunaflow/pages/insight.dart';
import 'package:lunaflow/pages/my_account.dart';
import 'package:lunaflow/services/user_model.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  final int index;
  const BottomNavigation({super.key, required this.index});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    List screenList = [
      const Dashboard(),
      const CyclePage(),
      const InsightsPage(),
      const CommunityPage(),
      const MyAccount()
    ];

    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(248, 216, 211, 100),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          backgroundColor: const Color.fromRGBO(248, 216, 211, 100),
          selectedItemColor: Colors.white, // Selected item color
          unselectedItemColor: const Color(0xFF6B7380), // Unselected item color
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
              label: 'view profile',
            ),
          ],
        ),
      ),
      body: screenList[pageIndex],
    );
  }
}
