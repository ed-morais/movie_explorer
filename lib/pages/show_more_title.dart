import 'package:flutter/material.dart';

import '../models/titles_info.dart';
import '../utils/custom_shape.dart';

class ShowMoreTitle extends StatelessWidget {
  final TitleInfo titleInfos;
  const ShowMoreTitle({
    super.key,
    required this.titleInfos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper:
                CustomShape(), // this is my own class which extendsCustomClipper
            child: Container(
              // height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    titleInfos.url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleInfos.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            titleInfos.genre,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.pink,
              ),
              Icon(
                Icons.star,
                color: Colors.pink,
              ),
              Icon(
                Icons.star,
                color: Colors.pink,
              ),
              Icon(
                Icons.star,
                color: Colors.pink,
              ),
              Icon(Icons.star),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Ano',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    titleInfos.year,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Tipo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    titleInfos.typeTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Avaliação',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    titleInfos.rating,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              titleInfos.sinopse,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
