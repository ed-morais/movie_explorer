import 'package:flutter/material.dart';

import '../app/routes/routes.dart';
import '../models/titles_info.dart';

class TitleCard extends StatelessWidget {
  // final String url;
  final TitleInfo titleInfos;
  const TitleCard({
    super.key,
    required this.titleInfos,
    // required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // elevation: 5,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RoutesApp.showMoreTitle, arguments: titleInfos);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  titleInfos.url,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    titleInfos.title,
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
                            titleInfos.typeTitle,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        titleInfos.genre,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 15.0,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        titleInfos.year,
                        style: const TextStyle(
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
    );
  }
}
