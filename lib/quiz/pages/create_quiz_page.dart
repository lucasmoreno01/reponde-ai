import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/pages/quiz_details_page.dart';

class CreateQuizPage extends StatelessWidget {
  static const String routeName = "/create-quiz";
  const CreateQuizPage({super.key});

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
              'Titulo do quiz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextField(controller: inputController),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (inputController.text.trim().isNotEmpty) {

                    Navigator.pushNamed(
                      context,
                      QuizDetailsPage.routeName,
                    
                      arguments: {'title': inputController.text},
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Escreva um Título")),
                    );
                  }
                },
                child: Text("Começe a criar seu quiz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
