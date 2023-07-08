import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/config/const.dart';
import '../providers/titles_provider.dart';

class FilterOption extends StatelessWidget {
  final String ptGenre;
  final String enGenre;

  const FilterOption({
    super.key,
    required this.ptGenre,
    required this.enGenre,
  });

  @override
  Widget build(BuildContext context) {
    final titleProvider = Provider.of<TitlesProvider>(context, listen: false);
    return GestureDetector(
      onTap: () async {
        titleProvider.clearTitles();
        await titleProvider.fetchTitles('$kBaseUrl&genre=$enGenre');
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          ptGenre,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }
}
