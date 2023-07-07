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

    final http.Response response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': kXRapidAPIKey,
        'X-RapidAPI-Host': kXRapidAPIHost
      },
    );
    statusRequisition = response.statusCode;
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<Map<String, dynamic>> titlesList =
          List.castFrom(body['results']);

      populateImages(titlesList);
    } else {
      debugPrint('>>>>>>>>>>>>>>>>>>>>>>>Erro ao carregar dados da API');
    }
  }

  void populateImages(List<Map<String, dynamic>> imagesList) {
    for (Map<String, dynamic> elem in imagesList) {
      _titles.add(TitleInfo(
        id: elem['id'] ?? 'id-X',
        url: elem['primaryImage'] != null
            ? elem['primaryImage']['url']
            : 'https://nerdweb.com.br/uploads/1578511646-cropit-.jpg',
        genre: getGenres(elem['genres']['genres']),
        rating: elem['ratingsSummary']?['aggregateRating'] ?? 0.0,
        title: elem['titleText']?['text'] ?? "Não fornecido",
        sinopse: elem['plot']?['plotText']?['plainText'] ?? "Não fornecido",
        typeTitle: elem['titleType']?['text'] ?? "Não fornecido",
        year: elem['releaseYear']?['year']?.toString() ?? "2023",
        isSerie: elem['titleType']['isSeries'],
        seasons: elem['episodes'] != null
            ? elem['episodes']['seasons'][0]['number']
            : 0,
      ));
      // debugPrint(_titles[0].genre.toString());
    }
    notifyListeners();
  }

  Future<void> getEpisodesId(String id) async {
    episodesId.clear();
    episodes.clear();
    final Uri url =
        Uri.parse('https://moviesdatabase.p.rapidapi.com/titles/series/$id');

    final http.Response response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': kXRapidAPIKey,
        'X-RapidAPI-Host': kXRapidAPIHost
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<Map<String, dynamic>> idsSerie =
          List.castFrom(body['results']);

      for (Map<String, dynamic> result in idsSerie) {
        episodesId.add(result['tconst']);
      }

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
      final Uri url = Uri.parse(
          'https://moviesdatabase.p.rapidapi.com/titles/episode/$item?info=base_info');

      final http.Response response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': kXRapidAPIKey,
          'X-RapidAPI-Host': kXRapidAPIHost
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        body.forEach((id, data) {
          episodes.add(EpisodeInfo(
            id: data['id'],
            title: data['titleText']['text'] ?? 'Não fornecido',
            genre: "Série",
            imgUrl: data['primaryImage'] != null
                ? data['primaryImage']['url']
                : "https://www.online-tech-tips.com/wp-content/uploads/2022/03/image-41.jpeg",
          ));
          notifyListeners();
        });

        debugPrint(episodes.toString());
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
    List<String> genresList = [];
    for (var genre in genres) {
      genresList.add(
        genre['text'],
      );
    }
    return genresList;
  }
}
