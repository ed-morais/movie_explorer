import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';
import '../pages/show_more_title.dart';
import '../providers/titles_provider.dart';
import 'routes/routes.dart';

class CatalogFlixApp extends StatelessWidget {
  const CatalogFlixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TitlesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        title: 'Catalog Flix',
        initialRoute: RoutesApp.home,

        routes: {
          RoutesApp.home: (context) => const HomePage(),
          RoutesApp.showMoreTitle: (context) => const ShowMoreTitle(),
        },
        // home: const HomePage(),
      ),
    );
  }
}
