import 'package:flutter/material.dart';

import '../../../config.dart';
import 'page_movie_home.dart';
import 'page_movie_item.dart';

void main() => runApp(const MyMovieApp());

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: CxConfig.background,
          primary: CxConfig.primary,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(fontSize: 18),
          backgroundColor: CxConfig.primary,
          shadowColor: Colors.transparent,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(20),
          //     bottomRight: Radius.circular(20),
          //   ),
          // ),
        ),
      ),
      // onGenerateRoute: (RouteSettings setting) {

      // },
      routes: {
        "/app/movie/home": (context) => const PageMovieHome(),
        "/app/movie/item": (context) => const PageMovieItem(),
      },
      title: 'Movie',

      home: const PageMovieHome(),
    );
  }
}
