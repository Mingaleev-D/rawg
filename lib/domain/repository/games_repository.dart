import 'package:dartz/dartz.dart';
import 'package:rawg/data/models/games_model.dart';

abstract class GamesRepository {
  Future<Either<String, GamesResponseModel>> getGames({int page = 1});
}
