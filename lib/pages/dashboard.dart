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
  bool isLoader = false;
  Map<String, dynamic>? UserData;
  List<Map<String, dynamic>>? questionnaires;
  String _base64Image = "";
  DateTime nextPeriod = DateTime.now();

  List<String> weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S']; // Weekday initials
  List<String> currentWeekDates = []; // To store current week's dates

  @override
  void initState() {
    super.initState();
    fetchUserData();
    _generateCurrentWeek(); // Generate the current week's dates
  }

  // Function to generate the current week's dates (7 days)
  void _generateCurrentWeek() {
    DateTime now = DateTime.now();
    int startOfWeek = now.weekday; // Get the current weekday (1 = Monday, 7 = Sunday)

    List<String> weekDates = [];
    for (int i = 0; i < 7; i++) {
      DateTime day = now.subtract(Duration(days: startOfWeek - i));
      weekDates.add(DateFormat('d').format(day)); // Format as day (1, 2, 3, ...)
    }

    setState(() {
      currentWeekDates = weekDates; // Update the week with current dates
    });
  }

  Future<void> fetchUserData() async {
    try {
      setState(() {
        isLoader = true;
      });
      final user = Provider.of<UserModel?>(context, listen: false);
      final questionData =
      await AuthService().getQuestionnaire(context, user!.uid);
      final data = await AuthService().getCurrentUser(context, user.uid);
      final nextPeriodDate = await AuthService().getNextPeriodDate(user.uid);
      setState(() {
        UserData = data.isNotEmpty ? data[0]['user'] : null;
        isLoader = false;
        questionnaires = questionData;
        nextPeriod = nextPeriodDate ?? DateTime.now();
      });
      print(questionData?[0]['selectedCycleLength']);
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < weekDays.length; i++)
                              Column(
                                children: [
                                  Text(weekDays[i]), // Display weekday initials (S, M, T...)
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: currentWeekDates.isNotEmpty && currentWeekDates[i] == DateFormat('d').format(DateTime.now())
                                          ? Colors.white
                                          : null,
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        currentWeekDates.isNotEmpty ? currentWeekDates[i] : '',
                                        style: TextStyle(
                                          color: currentWeekDates.isNotEmpty && currentWeekDates[i] == DateFormat('d').format(DateTime.now())
                                              ? Colors.black
                                              : null,
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
                        padding:
                        const EdgeInsets.symmetric(vertical: 24.0),
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
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
                                    DateFormat('dd MMM yyyy')
                                        .format(nextPeriod),
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/cycle');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      const Color(0xFFEEA09C),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
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
                Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Previous Period',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          questionnaires?[0]['selectedCycleLength'] ?? "",
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'NORMAL',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.info_outline, color: Colors.grey),
                        ],
                      ),
                    )),
                Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Previous period length',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          questionnaires?[0]['selectedCycleLength'] ?? "",
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'NORMAL',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.info_outline, color: Colors.grey),
                        ],
                      ),
                    )),
                Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Cycle length variation',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          questionnaires?[0]['selectedDuration'] ?? '',
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'NORMAL',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.info_outline, color: Colors.grey),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
