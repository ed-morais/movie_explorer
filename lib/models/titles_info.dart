class TitleInfo {
  String id;
  String url;
  String title;
  String typeTitle;
  List<dynamic> genre;

  String year;
  String sinopse;
  String rating;
  bool isSerie;
  int? seasons;


  TitleInfo({
    required this.id,
    required this.url,
    required this.title,
    required this.typeTitle,
    required this.genre,
    required this.year,
    required this.sinopse,
    required this.rating,
    required this.isSerie,
    required this.seasons,
  });
}
