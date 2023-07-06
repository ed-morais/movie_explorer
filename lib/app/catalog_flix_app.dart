import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/show_more_title.dart';
import 'routes/routes.dart';

class CatalogFlixApp extends StatelessWidget {
  const CatalogFlixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      title: 'Catalog Flix',
      initialRoute: RoutesApp.home,

      routes: {
        RoutesApp.home: (context) => const HomePage(),
        RoutesApp.showMoreTitle: (context) => const ShowMoreTitle(),
      },
      // home: const HomePage(),
    );
  }
}
