import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:rawg/common/constants/helpers/human_formats.dart';
import 'package:rawg/data/models/games_model.dart';
import 'package:rawg/ui/widgets/widgets.dart';

import '../../providers/providers.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('RAWG Database API'),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                child: const FlutterLogo(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Games',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                        side: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        )),
                    child: const Text(
                      'See all',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          const _WidgetGamesSlider(),
        ],
      ),
    );
  }
}

class _WidgetGamesSlider extends StatefulWidget {
  const _WidgetGamesSlider({super.key});

  @override
  State<_WidgetGamesSlider> createState() => _WidgetGamesSliderState();
}

class _WidgetGamesSliderState extends State<_WidgetGamesSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetGamesProvider>().getGames(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Consumer<GetGamesProvider>(
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
        if (provider.games.isNotEmpty) {
          return CarouselSlider.builder(
              itemCount: provider.games.length,
              itemBuilder: (context, index, realIndex) {
                final game = provider.games[index];
                return ItemGame(game);
              },
              options: CarouselOptions(
                height: 220,
                viewportFraction: 0.8,
                initialPage: 0,
                reverse: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ));
        }
        return Container(
          child: const Center(
            child: Text('No games'),
          ),
        );
      },
    ));
  }
}

class ItemGame extends Container {
  final GamesResult gameResult;

  ItemGame(this.gameResult, {super.key});

  @override
  Decoration? get decoration =>
      BoxDecoration(borderRadius: BorderRadius.circular(12));

  @override
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Widget? get child => Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ImageNetworkWidget(
            imageUrlSrc: gameResult.backgroundImage.toString(),
            height: 220,
            width: double.infinity,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [Colors.transparent, Colors.black87])),
        ),
        Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.star_half_outlined,
                        color: Colors.yellow.shade800),
                    const Gap(3),
                    Text(
                      HumanFormats.number(gameResult.rating, 1).toString(),
                      style: TextStyle(
                          color: Colors.yellow.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const Gap(10),
                    Text(
                      gameResult.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ))
      ]);
}
