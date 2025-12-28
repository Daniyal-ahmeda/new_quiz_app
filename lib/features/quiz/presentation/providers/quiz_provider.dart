import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/quiz.dart';
import '../../data/datasources/quiz_remote_data_source.dart';
import '../../data/repositories/quiz_repository_impl.dart';

final quizRemoteDataSourceProvider = Provider((ref) => QuizRemoteDataSource());

final quizRepositoryProvider = Provider((ref) {
  return QuizRepository(ref.watch(quizRemoteDataSourceProvider));
});

final featuredQuizzesProvider = FutureProvider<List<Quiz>>((ref) async {
  final repository = ref.watch(quizRepositoryProvider);
  return repository.getQuizzes();
});
