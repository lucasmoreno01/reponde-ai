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
}
