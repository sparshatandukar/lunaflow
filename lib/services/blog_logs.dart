import 'package:cloud_firestore/cloud_firestore.dart';

class Blogs {
  final CollectionReference periodCollection =
  FirebaseFirestore.instance.collection('blogs');

  Blogs();

  /// Adds or updates a questionnaire entry in Firestore
  Future<void> saveBlogs({
    required String userId,
    required String image,
    required String title,
    required String desc,
  }) async {
    try {
      // Construct the data to save
      Map<String, dynamic> data = {
        'userId': userId,
        'image': image,
        'title': title,
        'desc':desc
      };

      await periodCollection.add(data);


      print("Blogs successfully saved in Firestore.");
    } catch (e) {
      print("Error saving blogs data: $e");
      rethrow;
    }
  }
}