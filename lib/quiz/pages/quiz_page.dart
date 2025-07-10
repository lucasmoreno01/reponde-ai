import 'package:flutter/material.dart';
import 'package:responde_ai/quiz/model/quiz_model.dart';
import 'package:responde_ai/quiz/pages/quiz_result_page.dart';
import 'package:responde_ai/quiz/repository/quiz_repository.dart';
import 'package:responde_ai/shared/locator/service_locator.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';

class QuizPage extends StatefulWidget {
  static const String routeName = '/quiz';
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizzesRepository = getIt<QuizzesRepository>();
  Quiz? quiz;
  bool isLoading = true;
  String? quizId;

  int currentQuestionIndex = 0;
  Set<String> selectedAnswers = {};
  String? selectedAnswer;
  int correctAnswers = 0;
  bool answered = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (quizId == null) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      quizId = args['id'] as String;
      loadQuiz();
    }
  }

  Future<void> loadQuiz() async {
    try {
      final loadedQuiz = await quizzesRepository.getQuiz(quizId!);
      setState(() {
        quiz = loadedQuiz;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || quiz == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentQuestion = quiz!.questions[currentQuestionIndex];
    final isMultipleChoice = currentQuestion.isMultipleChoice;

    final markedOptions = (isMultipleChoice
        ? selectedAnswers.length > 1
        : selectedAnswer != null);

    void calculateCorrectAnswers() {
      if (isMultipleChoice) {
        final correctAnswerIds = currentQuestion.answers
            .where((answer) => answer.isCorrect)
            .map((answer) => answer.id)
            .toSet();

        if (selectedAnswers.length == correctAnswerIds.length &&
            selectedAnswers.difference(correctAnswerIds).isEmpty) {
          correctAnswers++;
        } // TODO pegar dinamicamente no factory
      } else {
        if (currentQuestion.answers.any(
          (answer) => answer.id == selectedAnswer && answer.isCorrect,
        )) {
          correctAnswers++;
        }
      }
    }

    void selectAnswer(String answerId) {
      if (answered) return;
      setState(() {
        if (isMultipleChoice) {
          if (selectedAnswers.contains(answerId)) {
            selectedAnswers.remove(answerId);
          } else {
            selectedAnswers.add(answerId);
          }
        } else {
          selectedAnswer = answerId;
        }
      });
    }

    void nextQuestion() {
      if (currentQuestionIndex < quiz!.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswers = {};
          selectedAnswer = null;
          answered = false;
        });
      } else {
        Navigator.pushNamed(
          context,
          QuizResultPage.routeName,
          arguments: {
            'correctAnswers': correctAnswers,
            'totalQuestions': quiz!.questions.length,
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz!.title, style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
        backgroundColor: ColorTheme.secondary,
        foregroundColor: ColorTheme.neutral200,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                currentQuestion.question,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: ColorTheme.neutral700,
                ),
              ),
              const SizedBox(height: 20),
              ...currentQuestion.answers.map((answer) {
                final isSelected = isMultipleChoice
                    ? selectedAnswers.contains(answer.id)
                    : selectedAnswer == answer.id;

                Color answerColor;
                if (isSelected) {
                  if (answered) {
                    answerColor = answer.isCorrect
                        ? ColorTheme.correct
                        : ColorTheme.wrong;
                  } else {
                    answerColor = ColorTheme.tertiary;
                  }
                } else {
                  if (answered && answer.isCorrect) {
                    answerColor = ColorTheme.neutral600;
                  } else {
                    answerColor = ColorTheme.neutral200;
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: answerColor,
                    title: Text(
                      answer.answer,
                      style: TextStyle(color: ColorTheme.neutral950),
                    ),
                    leading: isMultipleChoice
                        ? Checkbox(
                            value: isSelected,
                            onChanged: (_) => selectAnswer(answer.id),
                          )
                        : Radio<String>(
                            value: answer.id,
                            groupValue: selectedAnswer,
                            onChanged: (_) => selectAnswer(answer.id),
                          ),
                    onTap: () => selectAnswer(answer.id),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: !answered
            ? FilledButton(
                onPressed: markedOptions
                    ? () {
                        calculateCorrectAnswers();
                        setState(() {
                          answered = true;
                        });
                      }
                    : null,
                child: const Text('Responder'),
              )
            : FilledButton(
                onPressed: nextQuestion,

                child: Text(
                  currentQuestionIndex < quiz!.questions.length - 1
                      ? 'Próxima Pergunta'
                      : 'Finalizar Quiz',
                ),
              ),
      ),
    );
  }
}
