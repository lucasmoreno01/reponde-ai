class Quiz {
  final String id;
  final List<Question> questions;
  final int correctQuantity;
  final String title;

  Quiz({
    required this.id,
    required this.questions,
    required this.correctQuantity,
    required this.title,
  });
}

class Question {
  final String id;
  final String question;
  final List<Answer> answers;
  final bool isMultipleChoice;
 // TODO: Method to shuffle answers
  Question( {required this.id, required this.question, required this.answers, required this.isMultipleChoice} );
}

class Answer {
  final String id;
  final String answer;
  final bool isCorrect;

  Answer({required this.id, required this.answer, required this.isCorrect});
}

