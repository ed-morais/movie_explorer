import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../app/config/const.dart';
import '../models/titles_info.dart';

class TitlesProvider with ChangeNotifier {
  List<String> images = [
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
    'https://i.redd.it/i16fmegsy8z01.jpg',
    'https://media.fstatic.com/0Z-0wzgBZgF4t5H9pLcZtiNyyCo=/322x478/smart/filters:format(webp)/media/movies/covers/2013/06/aa6f4f0e1d552729617827fcf7bca549.jpg',
    'https://br.web.img2.acsta.net/pictures/14/11/25/19/43/167697.jpg',
    'https://conteudo.imguol.com.br/a0/2020/11/18/no-gogo-do-paulinho-1605727296067_v2_600x800.png.webp',
    'https://media.harrypotterfanzone.com/philosophers-stone-20-years-of-movie-magic-ron-poster.jpg',
    'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png',
    'https://m.media-amazon.com/images/I/61ueO4++bjL._AC_UF894,1000_QL80_.jpg',
    'https://image.tmdb.org/t/p/original/htZ0UOpRdKagXtC0QTIvdDjFl7R.jpg',
    'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/c104f1bfed20481f35bc96cb9addc940_240x360_crop_center.progressive.jpg?v=1573588574',
  ];
  final List<TitleInfo> _titles = [];

  List<TitleInfo> get titles => _titles;

  Future<void> fetchTitles() async {
    final Uri url = Uri.parse(kBaseUrl);

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
        url: elem['primaryImage']['url'] ??
            'https://nerdweb.com.br/uploads/1578511646-cropit-.jpg',
        genre: elem['genres']['genres'][0]['text'] ?? "Não fornecido",
        rating: elem['ratingsSummary']['aggregateRating'].toString() ??
            "Não fornecido",
        title: elem['titleText']['text'] ?? "Não fornecido",
        sinopse: elem['plot'] != null
            ? elem['plot']['plotText']['plainText']
            : "Não fornecido",
        typeTitle: elem['titleType']['text'] ?? "Não fornecido",
        year: elem['releaseYear']['year'].toString() ?? "->2023",
      ));
      debugPrint(_titles[0].genre.toString());
      notifyListeners();
    }
  }
}
