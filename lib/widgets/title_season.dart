import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/titles_provider.dart';
import 'episode_card.dart';

class SeasonTitle extends StatelessWidget {
  final int index;
  const SeasonTitle({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSeason = Provider.of<TitlesProvider>(context, listen: true);
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
          child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: titleSeason.episodes.length,
                itemBuilder: ((context, index) =>  EpisodeCard(episodeinfo: titleSeason.episodes[index]))
                  
              ),
          
        ),
      ],
    );
  }
}
