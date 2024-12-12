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

  Future<String?> signUp(
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
      );
      User? user = result.user;

      if (user == null) {
        _showSnackBar(context, "Registration failed", Colors.red);
        return null;
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
      return user.uid; // Return the user ID
    } catch (e) {
      _showSnackBar(
        context,
        "Registration failed: ${e.toString()}",
        Colors.red,
      );
      return null;
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
  Future<UserModel?> userLogIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _showSnackBar(
        context,
        "lOGIN SUCCESSFUL",
        Colors.green,
      );
      User? user = result.user;
      if (user == null) {
        _showSnackBar(
          context,
          "lOGIN FAILED",
          Colors.red,
        );
        return null;
      }
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        _showSnackBar(
          context,
          "Login failed",
          Colors.red,
        );
        return null;
      }  Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      return _userFromFirebaseUser(user, data);
    } catch (e) {
      _showSnackBar(
        context,
        "Login failed $e",
        Colors.red,
      );
      return null;
    }
  }

  Future<List> getCurrentUser(
      BuildContext context, String uid, ) async {
    try {
      final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!userSnapshot.exists) {
        return [];
      }

      final data = userSnapshot.data() as Map<String, dynamic>;
      return [
        {
          'user': {...data, 'id': userSnapshot.id},
        }
      ];
    } catch (e) {
      throw Exception("Failed to fetch user data: $e");
    }
  }
  Future<DateTime?> getNextPeriodDate(String userId) async {
    try {
      // Fetch user document from Firestore
      final userDoc = await FirebaseFirestore.instance.collection('questions')
          .where('userId', isEqualTo: userId)
          .get();

      if (userDoc.docs.isEmpty) {
        print("User data not found");
        return null;
      }

      final data = userDoc.docs.first.data();

      // Retrieve and parse the last period date
      final lastPeriodDateString = data['date'] as String? ?? ''; // Default to empty string if null
      final lastPeriodDate = parseDate(lastPeriodDateString);
      if (lastPeriodDate == null) {
        print("Invalid or missing last period date");
        return null;
      }

      // Retrieve and parse the cycle length
      final cycleLengthRange = data['selectedCycleLength'] as String? ?? ''; // Default to empty string if null
      final cycleLength = parseCycleLength(cycleLengthRange);

      // Calculate the next period date
      final nextPeriodDate = lastPeriodDate.add(Duration(days: cycleLength));
      print("Next period date: $nextPeriodDate");
      return nextPeriodDate;
    } catch (e) {
      print("Error calculating next period date: $e");
      return null;
    }
  }

  // Helper function to parse date string into DateTime
  DateTime? parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      print("Error parsing date: $e");
      return null;
    }
  }

  // Helper function to parse cycle length range into an integer
  int parseCycleLength(String cycleLengthRange) {
    try {
      final parts = cycleLengthRange.split('-');
      final lowerBound = int.parse(parts.first.trim());
      return lowerBound;
    } catch (e) {
      print("Error parsing cycle length range: $e");
      return 28; // Default to a common average cycle length
    }
  }

// Additional AuthService methods (e.g., login, signup) would go here...
}
// Additional methods can go here...
