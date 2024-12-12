import 'package:flutter/material.dart';
import 'package:lunaflow/pages/cycle_page.dart';
import 'package:lunaflow/services/auth/auth.dart';
import 'package:provider/provider.dart';
import '../services/user_model.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoader = true;
  Map<String, dynamic>? UserData;
  String _base64Image = "";
  bool isLoading = false;
  DateTime nextPeriod = DateTime.now(); // Initialized with default value

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      setState(() {
        isLoader = true;
      });
      final user = Provider.of<UserModel?>(context, listen: false);

      final data = await AuthService().getCurrentUser(context, user!.uid);
      final nextPeriodDate = await AuthService().getNextPeriodDate(user.uid);

      setState(() {
        UserData = data.isNotEmpty ? data[0]['user'] : null;
        isLoader = false;
        nextPeriod = nextPeriodDate ?? DateTime.now();
      });
    } catch (e) {
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoader
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
      backgroundColor: const Color(0xFFFDF8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F6),
        elevation: 0,
        title: Row(
          children: [
            const Text(
               'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              UserData?['fullName'] ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEA09C),
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
                              decoration: const BoxDecoration(
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
                                  Text(
                                    DateFormat('dd MMM yyyy').format(nextPeriod),
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFEEA09C),
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
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Symptoms',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
