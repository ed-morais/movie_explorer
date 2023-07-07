import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/titles_info.dart';
import '../providers/titles_provider.dart';
import '../utils/custom_shape.dart';
import '../widgets/rating_stars.dart';
import '../widgets/title_season.dart';

class ShowMoreTitle extends StatefulWidget {
  final TitleInfo titleInfos;

  const ShowMoreTitle({
    Key? key,
    required this.titleInfos,
  }) : super(key: key);

  @override
  State<ShowMoreTitle> createState() => _ShowMoreTitleState();
}

class _ShowMoreTitleState extends State<ShowMoreTitle> {
  @override
  void initState() {
    if (widget.titleInfos.isSerie) {
      final providerTitle = Provider.of<TitlesProvider>(context, listen: false);
      providerTitle.getEpisodesId(widget.titleInfos.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<TitlesProvider>(context, listen: false);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.titleInfos.url,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            expandedHeight: 420,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    widget.titleInfos.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.titleInfos.genre.join(', '),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),

                   Center(
                    child: RatingStars(rating: widget.titleInfos.rating != null ?  widget.titleInfos.rating!.toDouble() : 0.0 ),
                  ),
                  const SizedBox(height: 10.0),
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
                            widget.titleInfos.year,
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
                            widget.titleInfos.typeTitle,
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
                            widget.titleInfos.rating.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      widget.titleInfos.sinopse,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  if (widget.titleInfos.isSerie)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.titleInfos.seasons,
                        itemBuilder: (context, index) =>
                            SeasonTitle(index: index + 1),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

