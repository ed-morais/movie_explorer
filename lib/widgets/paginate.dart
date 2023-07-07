import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:movie_explorer/providers/titles_provider.dart';
import 'package:provider/provider.dart';

import '../app/config/const.dart';

class Paginate extends StatefulWidget {
  const Paginate({super.key});

  @override
  State<Paginate> createState() => _PaginateState();
}

class _PaginateState extends State<Paginate> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    final page = Provider.of<TitlesProvider>(context, listen: false);
    return Pagination(
      height: 50.0,
      width: MediaQuery.of(context).size.width * .6, // this prop is optional
      paginateButtonStyles: PaginateButtonStyles(
        backgroundColor: Colors.green,
      ),
      prevButtonStyles: PaginateSkipButton(
          buttonBackgroundColor: Colors.green,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      nextButtonStyles: PaginateSkipButton(
          buttonBackgroundColor: Colors.green,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      onPageChange: (number) {
        setState(() {
          page.page = number;
        });
        page.titles.clear();
        page.fetchTitles('$kBaseUrl&page=${page.page}');
      },
      useGroup: true,
      totalPage: 50,
      show: 4,
      currentPage: page.page,
    );
  }
}
