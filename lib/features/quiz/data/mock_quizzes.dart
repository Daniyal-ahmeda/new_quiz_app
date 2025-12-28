import '../domain/entities/quiz.dart';

final List<Quiz> premadeQuizzes = [
  const Quiz(
    id: '1',
    title: 'General Knowledge',
    description: 'Test your wits with these random facts!',
    imageUrl:
        'https://images.unsplash.com/photo-1493612276216-ee3925520721', // Example
    questions: [
      Question(
        text: 'What is the capital of France?',
        options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
        correctIndex: 2,
      ),
      Question(
        text: 'Which planet is known as the Red Planet?',
        options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
        correctIndex: 1,
      ),
      Question(
        text: 'Who wrote "Romeo and Juliet"?',
        options: [
          'Charles Dickens',
          'Jane Austen',
          'William Shakespeare',
          'Mark Twain',
        ],
        correctIndex: 2,
      ),
    ],
  ),
  const Quiz(
    id: '2',
    title: 'Science & Nature',
    description: 'Explore the wonders of the natural world.',
    imageUrl: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d',
    questions: [
      Question(
        text: 'What is the chemical symbol for Gold?',
        options: ['Ag', 'Au', 'Fe', 'Hg'],
        correctIndex: 1,
      ),
      Question(
        text: 'What corresponds to the letter "C" in E=mc^2?',
        options: ['Current', 'Charge', 'Speed of Light', 'Constant'],
        correctIndex: 2,
      ),
    ],
  ),
  const Quiz(
    id: '3',
    title: 'Flutter Trivia',
    description: 'How well do you know the framework?',
    imageUrl: 'https://images.unsplash.com/photo-1617042375876-a13e36732a04',
    questions: [
      Question(
        text: 'Which language is Flutter built with?',
        options: ['Java', 'Swift', 'Dart', 'Kotlin'],
        correctIndex: 2,
      ),
      Question(
        text: 'Who developed Flutter?',
        options: ['Facebook', 'Google', 'Microsoft', 'Apple'],
        correctIndex: 1,
      ),
    ],
  ),
];
