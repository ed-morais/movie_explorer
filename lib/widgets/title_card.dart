import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
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
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://assetsio.reedpopcdn.com/d3kbgdsu8aahbys.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp',
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Avengers End Game',
                    style: TextStyle(
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
                          Icon(
                            Icons.movie,
                            size: 15.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Filme',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Documentário',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 15.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '2019',
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
    );
  }
}
