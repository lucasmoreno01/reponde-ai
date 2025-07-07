
import 'package:responde_ai/quiz/model/quiz_moldel.dart';

final List<Quiz> quizzes = [
  Quiz(
    id: 'quiz1',
    title: 'General Knowledge',
    correctQuantity: 3,
    questions: [
      Question(
        isMultipleChoice: true,

        id: 'q1',
        question: 'What is the capital of France?',
        answers: [
          Answer(id: 'a1', answer: 'Paris', isCorrect: true),
          Answer(id: 'a2', answer: 'London', isCorrect: false),
          Answer(id: 'a3', answer: 'Berlin', isCorrect: true),
          Answer(id: 'a4', answer: 'Madrid', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q2',
        question: 'Which planet is known as the Red Planet?',
        answers: [
          Answer(id: 'a1', answer: 'Mars', isCorrect: true),
          Answer(id: 'a2', answer: 'Venus', isCorrect: false),
          Answer(id: 'a3', answer: 'Jupiter', isCorrect: false),
          Answer(id: 'a4', answer: 'Saturn', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q3',
        question: 'Who wrote "Romeo and Juliet"?',
        answers: [
          Answer(id: 'a1', answer: 'William Shakespeare', isCorrect: true),
          Answer(id: 'a2', answer: 'Charles Dickens', isCorrect: false),
          Answer(id: 'a3', answer: 'Jane Austen', isCorrect: false),
          Answer(id: 'a4', answer: 'Mark Twain', isCorrect: false),
        ],
      ),
    ],
  ),
  Quiz(
    id: 'quiz2',
    title: 'Science',
    correctQuantity: 3,
    questions: [
      Question(
        isMultipleChoice: false,
        id: 'q1',
        question: 'What is H2O commonly known as?',
        
        answers: [
          Answer(id: 'a1', answer: 'Water', isCorrect: true),
          Answer(id: 'a2', answer: 'Oxygen', isCorrect: false),
          Answer(id: 'a3', answer: 'Hydrogen', isCorrect: false),
          Answer(id: 'a4', answer: 'Salt', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q2',
        question: 'What gas do plants absorb from the atmosphere?',
        answers: [
          Answer(id: 'a1', answer: 'Carbon Dioxide', isCorrect: true),
          Answer(id: 'a2', answer: 'Oxygen', isCorrect: false),
          Answer(id: 'a3', answer: 'Nitrogen', isCorrect: false),
          Answer(id: 'a4', answer: 'Hydrogen', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q3',
        question: 'What is the boiling point of water?',
        answers: [
          Answer(id: 'a1', answer: '100°C', isCorrect: true),
          Answer(id: 'a2', answer: '0°C', isCorrect: false),
          Answer(id: 'a3', answer: '50°C', isCorrect: false),
          Answer(id: 'a4', answer: '200°C', isCorrect: false),
        ],
      ),
    ],
  ),
  Quiz(
    id: 'quiz3',
    title: 'Mathematics',
    correctQuantity: 3,
    questions: [
      Question(
        isMultipleChoice: false,

        id: 'q1',
        question: 'What is 2 + 2?',
        answers: [
          Answer(id: 'a1', answer: '4', isCorrect: true),
          Answer(id: 'a2', answer: '3', isCorrect: false),
          Answer(id: 'a3', answer: '5', isCorrect: false),
          Answer(id: 'a4', answer: '6', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q2',
        question: 'What is the square root of 9?',
        answers: [
          Answer(id: 'a1', answer: '3', isCorrect: true),
          Answer(id: 'a2', answer: '9', isCorrect: false),
          Answer(id: 'a3', answer: '6', isCorrect: false),
          Answer(id: 'a4', answer: '1', isCorrect: false),
        ],
      ),
      Question(
        isMultipleChoice: false,

        id: 'q3',
        question: 'What is 10 divided by 2?',
        answers: [
          Answer(id: 'a1', answer: '5', isCorrect: true),
          Answer(id: 'a2', answer: '2', isCorrect: false),
          Answer(id: 'a3', answer: '10', isCorrect: false),
          Answer(id: 'a4', answer: '20', isCorrect: false),
        ],
      ),
    ],
  ),
];
final List<String> test = [ 'w', 'w'];

