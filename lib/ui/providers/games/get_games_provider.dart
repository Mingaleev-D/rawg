import 'package:flutter/material.dart';
import 'package:rawg/data/models/games_model.dart';
import 'package:rawg/data/repository/games_repository_impl.dart';
import 'package:rawg/domain/repository/games_repository.dart';

class GetGamesProvider with ChangeNotifier {
  final GamesRepository _gamesRepository;

  GetGamesProvider(this._gamesRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<GamesResult> _games = [];
  List<GamesResult> get games => _games;

  void getGames(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final result = await _gamesRepository.getGames();
    result.fold((errorMessage) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      _isLoading = false;
      notifyListeners();
      return;
    }, (response) {
      _games.clear();
      _games.addAll(response.results);
      _isLoading = false;
      notifyListeners();
      return null;
    });
  }
}
