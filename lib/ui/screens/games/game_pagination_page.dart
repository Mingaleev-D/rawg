import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:rawg/data/models/games_model.dart';
import 'package:rawg/ui/providers/providers.dart';
import 'package:rawg/ui/screens/games/game_screen.dart';

class GamePaginationPage extends StatefulWidget {
  const GamePaginationPage({super.key});

  @override
  State<GamePaginationPage> createState() => _GamePaginationPageState();
}

class _GamePaginationPageState extends State<GamePaginationPage> {
  final PagingController<int, GamesResult> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<GetGamesProvider>().getGamesWithPaging(context,
          pagingController: _pagingController, page: pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RAWG"),
      ),
      body: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<GamesResult>(
          itemBuilder: (context, item, index) {
            return ItemGame(gameResult: item);
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
