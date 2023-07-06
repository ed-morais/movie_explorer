import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/titles_provider.dart';
import '../widgets/filter_modal.dart';
import '../widgets/title_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titlesProvider = Provider.of<TitlesProvider>(context, listen: false);
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
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: titlesProvider.images.length,
          itemBuilder: (BuildContext context, int index) {
            return TitleCard(
              url: titlesProvider.images[index],
            );
          }),
    );
  }
}
