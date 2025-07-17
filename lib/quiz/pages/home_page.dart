import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/pages/create_quiz_page.dart';
import 'package:responde_ai/quiz/pages/quiz_code.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Responde Aí!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            Column(
              spacing: 20,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () =>
                        Navigator.pushNamed(context,  QuizCode.routeName),
                    child: Text('Responder um Quiz'),
                  ),
                ),
             
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, CreateQuizPage.routeName),
                    child: Text('Crie seu Quiz'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
