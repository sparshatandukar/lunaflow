import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  final String uid;

  UserDatabase({required this.uid});

  // Reference to the 'users' collection in Firestore
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  // Update user data in Firestore
  Future<void> updateUserData({
    required String password,
    required String email,
    required String fullName,
    required String checkbox,
    required String image,
  }) async {
    try {
      // Save data to Firestore
      await userCollection.doc(uid).set({
        'email': email,
        'password': password,
        'checkbox': checkbox,
        'fullName': fullName,
        'image': image,
      });
    } catch (e) {
      // Log or handle the error outside this class
      throw Exception("Error during registration: $e");
    }
  }
}
