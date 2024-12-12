
import 'package:flutter/material.dart';
import 'package:lunaflow/landing%20page/welcomepage.dart';
import 'package:lunaflow/pages/bottom_navigation.dart';
import 'package:lunaflow/services/user_model.dart';
import 'package:provider/provider.dart';

class ServerTest extends StatefulWidget {
  const ServerTest({super.key});

  @override
  State<ServerTest> createState() => _ServerTestState();
}

class _ServerTestState extends State<ServerTest> {
  bool _isLoad = true;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);


    if (_isLoad) {
      _isLoad = false;
    }

    if (!_isLoad) {
      return const BottomNavigation(index: 0);

    }

    return const Center(
      child: CircularProgressIndicator(), // Loader while transitioning
    );
  }
}
