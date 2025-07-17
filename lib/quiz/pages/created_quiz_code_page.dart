import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responde_ai/quiz/pages/quiz_page.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';

class CreatedQuizCodePage extends StatelessWidget {
  static const String routeName = "/created-quiz-page";
  const CreatedQuizCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final quizCode = args['quizCode'] as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 24,
            children: [
              Column(
                spacing: 8,
                children: [
                  Text(
                    "Código do quiz: $quizCode",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: quizCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Código cópiado!")),
                      );
                    },
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.content_copy, color: ColorTheme.neutral700),
                        Text("Copiar código"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  child: Text("Ir para página inicial"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(
                  context,
                  QuizPage.routeName,
                  arguments: {'id': quizCode},
                ),
                  child: Text("Responda seu quiz"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
