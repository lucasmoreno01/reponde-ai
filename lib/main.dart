import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/pages/home_page.dart';
import 'package:responde_ai/quiz/pages/quiz_page.dart';
import 'package:responde_ai/quiz/pages/quiz_result_page.dart';
import 'package:responde_ai/shared/theme/app_theme.dart';

void main() {
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
      },
      title: 'Responde Aí!',
      theme: AppTheme.appTheme(context),
    );
  }
}
