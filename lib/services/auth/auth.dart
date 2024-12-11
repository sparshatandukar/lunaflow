import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunaflow/services/user_model.dart';
import 'package:lunaflow/services/users_db.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user, Map<String, dynamic>? userData) {
    return user != null && userData != null
        ? UserModel(
      uid: user.uid,
      email: userData['email'] ?? '',
      password: userData['password'] ?? '',
    )
        : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().asyncMap((User? user) async {
      if (user == null) return null;

      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) return null;

      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return _userFromFirebaseUser(user, userData);
    });
  }

  Future<void> signUp(
      BuildContext context,
      String email,
      String password,
      String fullName,
      String checkbox,
      String image,
      ) async {
    try {
      // Register user with FirebaseAuth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );  _showSnackBar(context, "$result failed", Colors.red);
      User? user = result.user;

      if (user == null) {
        _showSnackBar(context, "Registration failed", Colors.red);
        return;
      }

      // Save user data to Firestore
      await UserDatabase(uid: user.uid).updateUserData(
        fullName: fullName,
        email: email,
        checkbox: checkbox,
        password: password,
        image: image,
      );

      _showSnackBar(context, "User registered successfully!", Colors.green);
    } catch (e) {
      _showSnackBar(
        context,
        "Registration failed: ${e.toString()}",
        Colors.red,
      );
    }
  }

  // Helper function to show a snackbar
  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: color,
      ),
    );
  }

// Additional methods can go here...
}
