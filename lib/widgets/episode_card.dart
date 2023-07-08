import 'package:flutter/material.dart';

import '../models/episode_info.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeInfo episodeinfo;
  const EpisodeCard({
    super.key,
    required this.episodeinfo,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 160, // Defina a largura desejada aqui
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // elevation: 5,
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  episodeinfo.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        const Icon(Icons.account_tree_sharp, size: 15.0,),
                         const SizedBox(width: 5.0),
                    Flexible(
                      child: Text(
                        episodeinfo.title,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                      ],
                    ),
                    const SizedBox(height: 5.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.movie,
                              size: 15.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Episódio',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
