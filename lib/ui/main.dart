import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawg/common/app_constants.dart';
import 'package:rawg/data/repository/games_repository_impl.dart';
import 'package:rawg/domain/repository/games_repository.dart';
import 'package:rawg/ui/screens/screens.dart';

import 'providers/providers.dart';

void main() {
  final dioOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      queryParameters: {'key': AppConstants.apiKey});
  final Dio dio = Dio(dioOptions);
  final GamesRepository gamesRepository = GamesRepositoryImpl(dio);
  runApp(MyApp(
    gamesRepository: gamesRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.gamesRepository});

  final GamesRepository gamesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => GetGamesProvider(gamesRepository))
        ],
        child: MaterialApp(
            title: 'RAWG',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: const GameScreen()));
  }
}
