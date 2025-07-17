import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/model/quiz_model.dart';
import 'package:responde_ai/quiz/pages/created_quiz_code_page.dart';
import 'package:responde_ai/quiz/repository/quiz_repository.dart';
import 'package:responde_ai/shared/locator/service_locator.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';
import 'package:responde_ai/utils/ramdom_code_generator.dart';

class QuizDetailsPage extends StatefulWidget {
  static const String routeName = "/quiz-details";

  const QuizDetailsPage({super.key});

  @override
  State<QuizDetailsPage> createState() => _QuizDetailsPageState();
}

class _QuizDetailsPageState extends State<QuizDetailsPage> {
  final List<Answer> answers = [];
  final List<Question> questions = [];
  final TextEditingController questionInputController = TextEditingController();
  final quizzesRepository = getIt<QuizzesRepository>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final quizTitle = args?['title'] ?? '';
    bool isLoading = false;

    void createAnswer() {
      String questionsId = "${questions.length + 1}";

      bool isMultipleChoice = answers.where((a) => a.isCorrect!).length > 1;
      questions.add(
        Question(
          id: questionsId,
          question: questionInputController.text,
          answers: List<Answer>.from(answers),
          isMultipleChoice: isMultipleChoice,
        ),
      );
      questionInputController.clear();
    }

    if (isLoading == true) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              TextField(
                controller: questionInputController,
                decoration: InputDecoration(label: Text("Pergunta")),
              ),
              SizedBox(height: 60),
              Column(
                spacing: 8,
                children: [
                  ...answers.map((answer) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Dismissible(
                        key: ValueKey(answer.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: ColorTheme.wrong,
                          ),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            answers.remove(answer);
                          });
                        },
                        child: ListTile(
                          tileColor: answer.isCorrect!
                              ? ColorTheme.correct
                              : ColorTheme.neutral200,
                          title: Text(answer.answer),
                          onTap: () {
                            setState(() {
                              answer.isCorrect = !answer.isCorrect!;
                            });
                          },
                        ),
                      ),
                    );
                  }),

                  GestureDetector(
                    onTap: () {
                      if (answers.length < 5) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController();
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: _AddAnswerDialog(
                                onAdd: (value) {
                                  final String answerId =
                                      "${answers.length + 1}";
                                  setState(() {
                                    answers.add(
                                      Answer(
                                        id: answerId,
                                        answer: value,
                                        isCorrect: false,
                                      ),
                                    );
                                  });
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Não é possível adicionar mais alternativas",
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.add_circle),
                        Text(
                          answers.isNotEmpty
                              ? "Adicionar nova alternativa"
                              : "Adicionar alternativa",
                        ),
                      ],
                    ),
                  ),
                ],
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
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  final int correctAnswersLength = answers
                      .where((a) => a.isCorrect!)
                      .length;
                  if (questionInputController.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Adicione uma pergunta")),
                    );
                  } else if (answers.length < 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Adicione ao menos 2 respostas")),
                    );
                  } else if (correctAnswersLength < 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adicione ao menos 1 resposta correta"),
                      ),
                    );
                  } else {
                    createAnswer();
                    answers.clear();
                    setState(() {});
                  }
                },
                child: Text('Adicionar Outra Pergunta'),
              ),
            ),

            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });

                    final quizCode = generateRandomCode();

                    createAnswer();
                    await quizzesRepository.createQuiz(
                      quiz: Quiz(questions: questions, title: quizTitle),
                      quizCode: quizCode,
                    );

                    if (context.mounted) {
                      Navigator.pushNamed(
                        context,
                        CreatedQuizCodePage.routeName,
                        arguments: {"quizCode": quizCode},
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    throw (Exception(e));
                  }
                },
                child: Text('Finalizar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddAnswerDialog extends StatefulWidget {
  final Function(String) onAdd;
  const _AddAnswerDialog({required this.onAdd});

  @override
  State<_AddAnswerDialog> createState() => _AddAnswerDialogState();
}

class _AddAnswerDialogState extends State<_AddAnswerDialog> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Adicionar Alternativa',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Digite a alternativa'),

            maxLines: 2,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
              ),
              SizedBox(width: 32),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      widget.onAdd(controller.text);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
