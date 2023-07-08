import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/config/const.dart';
import '../providers/titles_provider.dart';
import '../widgets/info_modal.dart';
import '../widgets/filter_option.dart';
import '../widgets/paginate.dart';
import '../widgets/title_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget indicatorRequest = Center(
    child: Container(
      margin: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator(
        color: Colors.green,
      ),
    ),
  );
  @override
  void initState() {
    _loadTitles();
    super.initState();
  }

  _loadTitles() async {
    final titlesProvider = Provider.of<TitlesProvider>(context, listen: false);
    await titlesProvider.fetchTitles('$kBaseUrl&page=1');
    if (titlesProvider.statusRequisition != 200) {
      setState(() {
        error();
      });
    }
  }

  void error() {
    setState(() {
      indicatorRequest = const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50.0,
          ),
          SizedBox(height: 10.0,),
          Text(
            'Erro ao carregar informações da API',
            style: TextStyle(fontSize: 20.0),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final titlesProvider = Provider.of<TitlesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog Flix'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const InfoModal();
                },
              );
            },
            icon: const Icon(Icons.group),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: kGenres.length,
  itemBuilder: (BuildContext context, int index) {
    String genre = kGenres.keys.elementAt(index);
    // debugPrint(genre);
    String enGenre = genre;
    String ptBrGenre = kGenres[genre]!;
    return SizedBox(
      width: 150,
      child: FilterOption(ptGenre: ptBrGenre, enGenre: enGenre),
    );
  },
),
          ),
          const SizedBox(
            height: 10.0,
          ),
          titlesProvider.titles.isEmpty
              ? indicatorRequest
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.55,
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
