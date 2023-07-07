import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/config/const.dart';
import '../providers/titles_provider.dart';
import '../widgets/filter_modal.dart';
import '../widgets/filter_option.dart';
import '../widgets/paginate.dart';
import '../widgets/title_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final titlesProvider = Provider.of<TitlesProvider>(context, listen: false);
    titlesProvider.fetchTitles('$kBaseUrl&page=1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titlesProvider = Provider.of<TitlesProvider>(context, listen: true);
    // titlesProvider.fetchTitles();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog Flix'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const FilterModal();
                },
              );
            },
            icon: const Icon(Icons.manage_search),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kgenres.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 150,
                  child: FilterOption(genre: kgenres[index]),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: titlesProvider.titles.length,
              itemBuilder: (BuildContext context, int index) {
                return TitleCard(
                  titleInfos: titlesProvider.titles[index],
                  // url: titlesProvider.images[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Container(
          alignment: Alignment.center,
          child: const Paginate(),
        ),
      ),
    );
  }
}
