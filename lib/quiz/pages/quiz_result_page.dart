import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  static const String routeName = '/quiz-result';
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final correctAnswers = args['correctAnswers'] as int;
    final totalQuestions = args['totalQuestions'] as int;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
              (correctAnswers/totalQuestions >= 0.5) ?  "Parabéns": "Não foi dessa vez",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Você acertou $correctAnswers de $totalQuestions questões!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
        
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')),
                child: Text('Página inicial'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
