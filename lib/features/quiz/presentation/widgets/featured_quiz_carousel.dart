import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/quiz.dart';
import '../pages/quiz_playing_page.dart';
import '../providers/quiz_provider.dart';

class FeaturedQuizCarousel extends ConsumerWidget {
  const FeaturedQuizCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzesAsync = ref.watch(featuredQuizzesProvider);

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Featured Quizzes',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: 220,
            child: quizzesAsync.when(
              data: (quizzes) => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return _QuizCard(quiz: quizzes[index]);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, stack) =>
                  Center(child: Text('Error loading quizzes: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  final Quiz quiz;

  const _QuizCard({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      child: CustomCard(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => QuizPlayingPage(quiz: quiz)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors
                    .primaries[quiz.title.length % Colors.primaries.length]
                    .shade100,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.quiz,
                  size: 40,
                  color: Colors
                      .primaries[quiz.title.length % Colors.primaries.length],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${quiz.questions.length} Questions',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
