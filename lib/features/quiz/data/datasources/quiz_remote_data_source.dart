import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/quiz.dart';

class QuizRemoteDataSource {
  final String _apiKey = 'CkDkVLJtSvgKHshEnj8UHTHoUxPKLk0oWjNvj60R';
  final String _baseUrl = 'https://quizapi.io/api/v1/questions';

  Future<List<Quiz>> fetchQuizzes() async {
    final List<Quiz> quizzes = [];

    // Define the categories/tags we want to fetch to create distinct quizzes
    final topics = [
      {
        'tag': 'Linux',
        'title': 'Linux SysAdmin',
        'img': 'https://images.unsplash.com/photo-1629654297299-c8506221ca97',
      },
      {
        'tag': 'DevOps',
        'title': 'DevOps Engineering',
        'img': 'https://images.unsplash.com/photo-1667372393119-c81c0cda71a9',
      },
      {
        'tag': 'Docker',
        'title': 'Docker Containerization',
        'img': 'https://images.unsplash.com/photo-1605745341112-85968b19335b',
      },
      {
        'tag': 'SQL',
        'title': 'SQL Databases',
        'img': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
      },
      {
        'tag': 'Code',
        'title': 'General Coding',
        'img': 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
      },
      {
        'tag': 'JavaScript',
        'title': 'JavaScript Mastery',
        'img': 'https://images.unsplash.com/photo-1579468118864-1b9ea3c0db4a',
      },
      {
        'tag': 'HTML',
        'title': 'HTML5 & Web',
        'img': 'https://images.unsplash.com/photo-1507721999472-8ed4421c4af2',
      },
      {
        'tag': 'Kubernetes',
        'title': 'K8s Orchestration',
        'img': 'https://images.unsplash.com/photo-1667372393086-9d4001d51cf1',
      },
      {
        'tag': 'PHP',
        'title': 'PHP Backend',
        'img': 'https://images.unsplash.com/photo-1599507593548-0187ac4043c6',
      },
      {
        'tag': 'Bash',
        'title': 'Bash Scripting',
        'img': 'https://images.unsplash.com/photo-1629654297299-c8506221ca97',
      },
    ];

    for (var topic in topics) {
      try {
        final url = Uri.parse(
          '$_baseUrl?apiKey=$_apiKey&limit=5&tags=${topic['tag']}',
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          if (data.isNotEmpty) {
            final questions = data
                .map<Question?>((q) {
                  // Parse Answers (remove nulls)
                  final Map<String, dynamic> answersMap = q['answers'];
                  final List<String> options = [];
                  final List<String> validKeys =
                      []; // To track which keys (answer_a, etc) are valid

                  answersMap.forEach((key, value) {
                    if (value != null) {
                      options.add(value.toString());
                      validKeys.add(key);
                    }
                  });

                  // Find Correct Answer
                  final Map<String, dynamic> correctMap = q['correct_answers'];
                  int correctIndex = 0;

                  // correct_answers keys are like 'answer_a_correct', 'answer_b_correct'
                  // We need to match this with our validKeys list
                  for (int i = 0; i < validKeys.length; i++) {
                    final answerKey = validKeys[i]; // e.g., 'answer_a'
                    final correctKey =
                        '${answerKey}_correct'; // 'answer_a_correct'

                    if (correctMap[correctKey] == 'true') {
                      correctIndex = i;
                      break;
                    }
                  }

                  if (options.isEmpty) return null;

                  return Question(
                    text: q['question'] ?? 'Unknown Question',
                    options: options,
                    correctIndex: correctIndex,
                  );
                })
                .whereType<Question>()
                .toList(); // Filter out failures

            if (questions.isNotEmpty) {
              quizzes.add(
                Quiz(
                  id: 'quiz_${topic['tag']}',
                  title: topic['title']!,
                  description: 'Expert questions on ${topic['tag']}',
                  imageUrl: topic['img']!,
                  questions: questions,
                ),
              );
            }
          }
        } else {
          print('API Error for ${topic['tag']}: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching topic ${topic['tag']}: $e');
      }
    }
    return quizzes;
  }
}
