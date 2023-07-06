import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class CatalogFlixApp extends StatelessWidget {
  const CatalogFlixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      title: 'Catalog Flix',
      home: const HomePage(),
    );
  }
}
