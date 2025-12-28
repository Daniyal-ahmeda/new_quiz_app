import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/common_button.dart';
import '../../domain/entities/quiz.dart';

class QuizPlayingPage extends StatefulWidget {
  final Quiz quiz;

  const QuizPlayingPage({super.key, required this.quiz});

  @override
  State<QuizPlayingPage> createState() => _QuizPlayingPageState();
}

class _QuizPlayingPageState extends State<QuizPlayingPage> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;
  int _score = 0;
  bool _isAnswered = false;

  void _answerQuestion(int index) {
    if (_isAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
      _isAnswered = true;
      if (index == widget.quiz.questions[_currentQuestionIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
        _isAnswered = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text(
          'You scored $_score/${widget.quiz.questions.length}',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close dialog
              Navigator.of(context).pop(); // Close quiz page
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${widget.quiz.questions.length}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              question.text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            ...List.generate(question.options.length, (index) {
              final isSelected = _selectedOptionIndex == index;
              final isCorrect = index == question.correctIndex;
              final showColor = _isAnswered && (isSelected || isCorrect);

              Color borderColor = Colors.grey.shade300;
              Color bgColor = Colors.white;
              Color iconColor = Colors.grey;

              if (showColor) {
                if (isCorrect) {
                  borderColor = Colors.green;
                  bgColor = Colors.green.shade50;
                  iconColor = Colors.green;
                } else if (isSelected) {
                  borderColor = Colors.red;
                  bgColor = Colors.red.shade50;
                  iconColor = Colors.red;
                }
              } else if (isSelected) {
                borderColor = AppColors.primary;
                bgColor = AppColors.primary.withOpacity(0.05);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: () => _answerQuestion(index),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgColor,
                      border: Border.all(color: borderColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        if (showColor)
                          Icon(
                            isCorrect
                                ? Icons.check_circle
                                : (isSelected
                                      ? Icons.cancel
                                      : Icons.circle_outlined),
                            color: iconColor,
                          )
                        else
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.grey.shade400,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            if (_isAnswered)
              CommonButton(
                label: _currentQuestionIndex < widget.quiz.questions.length - 1
                    ? 'Next Question'
                    : 'Finish Quiz',
                onPressed: _nextQuestion,
              ),
          ],
        ),
      ),
    );
  }
}
