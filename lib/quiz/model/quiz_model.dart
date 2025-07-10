class Quiz {
  final String id;
  final List<Question> questions;
  final String title;

  Quiz({required this.id, required this.questions, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'questions': questions.map((q) => q.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'].toString() ,
      title: map['title'] as String,
      questions: (map['questions'] as List)
          .map((q) => Question.fromMap(q as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Question {
  final String id;
  final String question;
  final List<Answer> answers;
  final bool isMultipleChoice;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.isMultipleChoice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'isMultipleChoice': isMultipleChoice,
      'answers': answers.map((a) => a.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'].toString(),
      question: map['question'] as String,
      isMultipleChoice: map['isMultipleChoice'] as bool,
      answers: (map['answers'] as List)
          .map((a) => Answer.fromMap(a as Map<String, dynamic>))
          .toList(),
    );
  }
}




class Answer {
  final String id;
  final String answer;
  final bool isCorrect;

  Answer({required this.id, required this.answer, required this.isCorrect});

    Map<String, dynamic> toMap() {
      return {
        'id': id,
        'answer': answer,
        'isCorrect': isCorrect,
      };
    }

    factory Answer.fromMap(Map<String, dynamic> map) {
      return Answer(
        id: map['id'].toString(),
        answer: map['answer'] as String,
        isCorrect: map['isCorrect'] as bool,
      );
    }
}

