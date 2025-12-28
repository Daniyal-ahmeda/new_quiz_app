class Quiz {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.questions,
  });
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}
