import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responde_ai/firebase_options.dart';
import 'package:responde_ai/quiz/pages/create_quiz_page.dart';
import 'package:responde_ai/quiz/pages/created_quiz_code_page.dart';
import 'package:responde_ai/quiz/pages/home_page.dart';
import 'package:responde_ai/quiz/pages/quiz_code.dart';
import 'package:responde_ai/quiz/pages/quiz_details_page.dart';
import 'package:responde_ai/quiz/pages/quiz_page.dart';
import 'package:responde_ai/quiz/pages/quiz_result_page.dart';
import 'package:responde_ai/shared/locator/service_locator.dart';
import 'package:responde_ai/shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const RespondeAiApp());
}

class RespondeAiApp extends StatelessWidget {
  const RespondeAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        QuizPage.routeName: (context) => const QuizPage(),
        QuizResultPage.routeName: (context) => const QuizResultPage(),
        QuizCode.routeName: (context) => const QuizCode(),
        CreateQuizPage.routeName: (context) => const CreateQuizPage(),
        QuizDetailsPage.routeName: (context) => QuizDetailsPage(),
        CreatedQuizCodePage.routeName: (context) => CreatedQuizCodePage(),
      },
      title: 'Responde Aí!',
      theme: AppTheme.appTheme(context),
    );
  }
}
