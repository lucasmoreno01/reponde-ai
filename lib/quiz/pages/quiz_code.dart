import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/pages/quiz_page.dart';
import 'package:responde_ai/quiz/repository/quiz_repository.dart';
import 'package:responde_ai/shared/locator/service_locator.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';

class QuizCode extends StatelessWidget {
  static const String routeName = "/quiz-code";
  const QuizCode({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzesRepository = getIt<QuizzesRepository>();
    final TextEditingController inputController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite o código do quiz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextField(controller: inputController),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  final bool hasQuiz = await quizzesRepository.hasThisQuiz(
                    inputController.text,
                  );

                  if (!context.mounted) return;

                  if (hasQuiz) {
                    Navigator.pushNamed(
                      context,
                      QuizPage.routeName,
                      arguments: {'id': inputController.text},
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Código inválido!",
                          style: TextStyle(fontSize: 16),
                        ),
                        backgroundColor: ColorTheme.wrong,
                      ),
                    );
                  }
                },
                child: Text("Ir para quiz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
