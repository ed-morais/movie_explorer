import 'package:flutter/material.dart';

import 'episode_card.dart';

class SeasonTitle extends StatelessWidget {
  final int index;
  const SeasonTitle({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Temporada ${index.toString()}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 15.0,),
        SizedBox( // Usando SizedBox para definir uma altura para o ListView
          height: 180, // Defina a altura desejada aqui
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              EpisodeCard(),
              EpisodeCard(),
              EpisodeCard(),
              EpisodeCard(),
              EpisodeCard(),
            ],
          ),
        ),
      ],
    );
  }
}
