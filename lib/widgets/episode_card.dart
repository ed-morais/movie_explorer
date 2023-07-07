import 'package:flutter/material.dart';

import '../models/episode_info.dart';

class EpisodeCard extends StatelessWidget {
final EpisodeInfo episodeinfo;
 const EpisodeCard({super.key, required this.episodeinfo,});
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
                    Text(
                     episodeinfo.title,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    // const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.movie,
                              size: 15.0,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              episodeinfo.genre,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Fiction',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 15.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Episode #1.1',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
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
