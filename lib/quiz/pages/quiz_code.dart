import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/pages/quiz_page.dart';

class QuizCode extends StatelessWidget {
  static const String routeName = "/quiz-code";
  const QuizCode({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite o ID do quiz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextField(controller: inputController),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  QuizPage.routeName,
                  arguments: {'id': inputController.text},
                ),
                child: Text("Ir para quiz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
