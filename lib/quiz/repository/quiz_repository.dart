import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responde_ai/quiz/model/quiz_model.dart';
import 'package:responde_ai/shared/service/firebase_service.dart';

class QuizzesRepository {
  final FirestoreService _firestoreService;

  QuizzesRepository(this._firestoreService);

  Future<Quiz> getQuiz(String id) async {
    try {
      final snapshot = await _firestoreService.read(
        collectionPath: 'quizzes',
        documentId: id,
      );

      if (snapshot == null) {
        throw Exception();
      }

      return Quiz.fromMap(snapshot.data()!);
    } catch (e) {
      throw Exception("Erro ao buscar quiz: $e");
    }
  }

  Future<bool> hasThisQuiz(String quizCode) async {
    try {
      final snapshot = await _firestoreService.read(
        collectionPath: "allQuizzes",
        documentId: "e7zzVbAAFUY9Sg2BcrdF",
      );

      if (snapshot == null) {
        throw Exception();
      }
      final quizzes = snapshot.data() as Map;
      final allQuizzes = quizzes["createdQuizzes"] as List;

      return allQuizzes.contains(quizCode);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createQuiz({
    required Quiz quiz,
    required String quizCode,
  }) async {
    try {
      await _firestoreService.create(
        collectionPath: "quizzes",
        documentId: quizCode,
        data: quiz.toMap(),
      );

      await _firestoreService.update(
        collectionPath: 'allQuizzes',
        documentId: 'e7zzVbAAFUY9Sg2BcrdF',
        data: {
          'createdQuizzes': FieldValue.arrayUnion([quizCode]),
        },
      );
    } catch (e) {
      throw Exception("Erro ao criar quiz: $e");
    }
  }
}
