import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunaflow/authentication/login.dart';
import 'package:lunaflow/pages/view_profile.dart';
import 'dart:convert';
import 'dart:typed_data';
class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  User? user; // To store the current user's data
  String? fullName;
  String? email;
  Uint8List? imageBytes;
  String _base64Image = "";
  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
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
          fullName = userData['fullName'] ?? '';
          email = userData['email'] ?? '';
          final base64Image = userData['image'] ?? '';


            try {
              imageBytes =
                  base64Decode(base64Image); // Decode base64 image data
            } catch (e) {
              print('Error decoding base64: $e');
              imageBytes = null; // Handle decoding error
            }

        });
      }
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        foregroundImage: imageBytes != null
          ? MemoryImage(imageBytes!) // Display decoded image
              : const AssetImage('assets/userprofile.jpg')
          as ImageProvider,
                        maxRadius: 50,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: constraints.maxWidth * 0.03,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit,
                                    size: 15, color: Colors.blue)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Display user's name
                      Text(
                        fullName ?? 'Your Name',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Display user's email
                      Text(
                        email ?? 'Your Email',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.04,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildListTile(Icons.person, 'Update Profile', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewProfile()),
                        );
                      }),
                      _buildListTile(Icons.logout, 'Logout', () async {
                        try {
                          await FirebaseAuth.instance.signOut();

                          // Clear the navigation stack and redirect to login
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                          );
                        } catch (e) {
                          // Handle errors if any
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error signing out: $e")),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title),
      trailing:
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[800]),
      onTap: onTap,
    );
  }
}
