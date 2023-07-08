import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app/config/const.dart';
import '../models/episode_info.dart';
import '../models/titles_info.dart';

class TitlesProvider with ChangeNotifier {
  final List<TitleInfo> _titles = [];
  final List<EpisodeInfo> episodes = [];
  final List<String> episodesId = [];
  late int statusRequisition;
  int page = 1;
  List<TitleInfo> get titles => _titles;

  Future<void> fetchTitles(String kUrl) async {
    final Uri url = Uri.parse(kUrl);

    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': kXRapidAPIKey,
        'X-RapidAPI-Host': kXRapidAPIHost,
      },
    );

    statusRequisition = response.statusCode;

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final titlesList = List<Map<String, dynamic>>.from(body['results']);

      populateImages(titlesList);
    } else {
      debugPrint('>>>>>>>>>>>>>>>>>>>>>>>Erro ao carregar dados da API');
    }
  }

  void populateImages(List<Map<String, dynamic>> imagesList) {
    _titles.addAll(
      imagesList.map((elem) {
        return TitleInfo(
          id: elem['id'] ?? 'id-X',
          url: elem['primaryImage']?['url'] ??
              'https://i.imgur.com/XoSf6bh.png',
          genre: getGenres(elem['genres']?['genres']),
          rating: elem['ratingsSummary']?['aggregateRating'] ?? 0.0,
          title: elem['titleText']?['text'] ?? 'Não fornecido',
          sinopse: elem['plot']?['plotText']?['plainText'] ?? 'Não fornecido',
          typeTitle: elem['titleType']?['text'] ?? 'Não fornecido',
          year: elem['releaseYear']?['year']?.toString() ?? '2023',
          isSerie: elem['titleType']?['isSeries'],
          seasons: elem['episodes']?['seasons']?[0]?['number'] ?? 0,
        );
      }),
    );
    notifyListeners();
  }

  Future<void> getEpisodesId(String id) async {
    episodesId.clear();
    episodes.clear();
    final Uri url = Uri.parse('https://moviesdatabase.p.rapidapi.com/titles/series/$id');

    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': kXRapidAPIKey,
        'X-RapidAPI-Host': kXRapidAPIHost,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final idsSerie = List<Map<String, dynamic>>.from(body['results']);

      episodesId.addAll(idsSerie.map<String>((result) => result['tconst'] as String));

      debugPrint(episodesId.toString());
      notifyListeners();
      getEpisodes(episodesId);
    } else {
      debugPrint('>>>>>>>>>>>>>>>>>>>>>>>Erro ao carregar dados da API');
    }
  }

  Future<void> getEpisodes(List<String> episodesId) async {
    episodes.clear();

    for (var item in episodesId) {
      final Uri url = Uri.parse('https://moviesdatabase.p.rapidapi.com/titles/episode/$item?info=base_info');

      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': kXRapidAPIKey,
          'X-RapidAPI-Host': kXRapidAPIHost,
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        body.forEach((id, episode) {
          episodes.add(EpisodeInfo(
            id: episode['id'],
            title: episode['titleText']['text'] ?? 'Não fornecido',
            imgUrl: episode['primaryImage']?['url'] ??
                'https://i.imgur.com/EIK73AR.png',
          ));
          notifyListeners();
        });

        // debugPrint(episodes.toString());
      } else {
        debugPrint('>>>>>>>>>>>>>>>>>>>>>>>Erro ao carregar dados da API');
      }
    }
  }

  void clearTitles() {
    _titles.clear();
    notifyListeners();
  }

  List<String> getGenres(List<dynamic> genres) {
    return genres.map<String>((genre) => genre['text'] as String).toList();
  }
}
