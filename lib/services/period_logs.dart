import 'package:cloud_firestore/cloud_firestore.dart';

class PeriodLogs {
  final CollectionReference periodCollection =
  FirebaseFirestore.instance.collection('period_logs');

  PeriodLogs();

  /// Adds or updates a questionnaire entry in Firestore
  Future<void> savePeriodLogs({
    required String userId,
    required String date,
    required String mood,
    required List<String> symptoms,
  }) async {
    try {
      // Construct the data to save
      Map<String, dynamic> data = {
        'userId': userId,
        'date': date,
        'mood': mood,
        'symptoms':symptoms
      };

      // Save the data in Firestore
      await periodCollection.doc(userId).set(data);

      print("Questionnaire successfully saved in Firestore.");
    } catch (e) {
      print("Error saving questionnaire data: $e");
      rethrow;
    }
  }
}