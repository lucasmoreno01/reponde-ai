import 'package:get_it/get_it.dart';
import 'package:responde_ai/quiz/repository/quiz_repository.dart';
import 'package:responde_ai/shared/service/firebase_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerFactory(() => QuizzesRepository(getIt()));
}
