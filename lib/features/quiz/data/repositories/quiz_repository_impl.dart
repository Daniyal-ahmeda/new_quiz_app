import '../../domain/entities/quiz.dart';
import '../datasources/quiz_remote_data_source.dart';

class QuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  QuizRepository(this.remoteDataSource);

  Future<List<Quiz>> getQuizzes() async {
    return await remoteDataSource.fetchQuizzes();
  }
}
