import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String error = '';
  String? email;

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget initializes
  }

  Future<void> _fetchUserData() async {
    try {
      // Get the current user ID from FirebaseAuth
      final String userId = FirebaseAuth.instance.currentUser!.uid;

      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        // Populate controllers with the fetched data
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          _nameController.text = userData['fullName'] ?? '';
          _phoneController.text = userData['password'] ?? '';
          _emailController.text = userData['email'] ?? '';
        });
      } else {
        setState(() {
          error = 'User data not found!';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Failed to fetch user data: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (error.isNotEmpty) ...[
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 10),
            ],
            // Profile picture with camera icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                    radius: 50, backgroundImage: AssetImage('image/luna.png')),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt,
                        color: Colors.white, size: 16),
                    onPressed: () async {
                      // Implement profile picture update
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Name field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Phone number field
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            // Email field (read-only)

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: const OutlineInputBorder(),
                hintText: email,
                enabled: false, // Make the email field read-only
              ),
            ),
            const SizedBox(height: 16),

            // Save button
            Custombutton(
              btnName: 'Save',
              onPressed: () {
                // Implement save functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
