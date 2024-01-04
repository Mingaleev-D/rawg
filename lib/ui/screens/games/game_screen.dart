import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetGamesProvider>().getGames(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: Consumer<GetGamesProvider>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          if (provider.games.isNotEmpty) {
            return ListView.builder(
              itemCount: provider.games.length,
              itemBuilder: (BuildContext context, int index) {
                final game = provider.games[index];
                return ListTile(
                  title: Text(game.name),
                  subtitle: Text(game.released.toString()),
                );
              },
            );
          }
          return const Center(
            child: Text('No games'),
          );
        },
      ),
    );
  }
}
