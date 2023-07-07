import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../app/config/const.dart';
import '../models/titles_info.dart';

class TitlesProvider with ChangeNotifier {
  final List<TitleInfo> _titles = [];
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

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<Map<String, dynamic>> titlesList =
          List.castFrom(body['results']);

      // debugPrint(titlesList.toString());
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
        genre: elem['genres'] != null
            ? elem['genres']['genres'][0]['text']
            : "Não fornecido",
        rating: elem['ratingsSummary']?['aggregateRating']?.toString() ??
            "Não fornecido",
        title: elem['titleText']?['text'] ?? "Não fornecido",
        sinopse: elem['plot']?['plotText']?['plainText'] ?? "Não fornecido",
        typeTitle: elem['titleType']?['text'] ?? "Não fornecido",
        year: elem['releaseYear']?['year']?.toString() ?? "->2023",
      ));
      debugPrint(_titles[0].genre.toString());
      notifyListeners();
    }
  }
}
