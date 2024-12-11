import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionnarieDb {
  final CollectionReference questionsCollection =
  FirebaseFirestore.instance.collection('questions');

  QuestionnarieDb();

  /// Adds or updates a questionnaire entry in Firestore
  Future<void> saveQuestionnaire({
    required String userId,
    required bool checkbox1,
    required bool checkbox2,
    required bool checkbox3,
    required bool checkbox4,
    required String selectedYear,
    required String selectedMonth,
    required String weight,
    required String height,
    required bool isMetric,
    required String activityLevel,
    required String date,
    required String selectedDuration,
    required String selectedCycle,
    required bool irregularPeriods,
    required List<String> diagnosedConditions,
    required List<String> severeSymptoms,
    required bool trackMoodOrSymptoms,
    required List<String> selectedGoals,
    required String preference,

  }) async {
    try {
      // Construct the data to save
      Map<String, dynamic> data = {
        'userId': userId,
        'checkbox1': checkbox1,
        'checkbox2': checkbox2,
        'checkbox3': checkbox3,
        'checkbox4': checkbox4,
        'selectedYear': selectedYear,
        'selectedMonth': selectedMonth,
        'weight': weight,
        'height': height,
        'isMetric': isMetric,
        'activityLevel': activityLevel,
        'date': date,
        'selectedDuration': selectedDuration,
        'selectedCycleLength': selectedCycle,
        'irregularPeriods': irregularPeriods,
        'diagnosedConditions': diagnosedConditions,
        'severeSymptoms': severeSymptoms,
        'trackMoodOrSymptoms': trackMoodOrSymptoms,
        'selectedGoals': selectedGoals,
        'preference':preference
      };

      // Save the data in Firestore
      await questionsCollection.doc(userId).set(data);

      print("Questionnaire successfully saved in Firestore.");
    } catch (e) {
      print("Error saving questionnaire data: $e");
      rethrow;
    }
  }
}