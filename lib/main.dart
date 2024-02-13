import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'homescreen.dart';
import 'favoritesscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '好みの選択',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
      ),
    );
  }
}
