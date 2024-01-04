import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rawg/data/models/games_model.dart';
import 'package:rawg/domain/repository/games_repository.dart';

class GamesRepositoryImpl implements GamesRepository {
  final Dio _dio;

  GamesRepositoryImpl(this._dio);

  @override
  Future<Either<String, GamesResponseModel>> getGames({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/games?',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200 && response.data != null) {
        final model = GamesResponseModel.fromJson(response.data);
        return Right(model);
      }
      return const Left('Something went wrong');
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }
      return const Left('No internet connection');
    }
  }
}
