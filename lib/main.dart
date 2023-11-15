import 'package:flutter/material.dart';
import 'package:flutter_cxui/config.dart';
import 'package:flutter_cxui/pages/example/movie/page_movie_home.dart';
import 'package:flutter_cxui/pages/example/movie/page_movie_item.dart';
import 'package:flutter_cxui/pages/page_card.dart';
import 'package:flutter_cxui/pages/page_icon_button.dart';
import 'package:flutter_cxui/pages/page_place_grid.dart';
import 'package:flutter_cxui/pages/page_select_button_list.dart';
import 'package:ionicons/ionicons.dart';

import 'pages/page_image_card.dart';

class RouteItem {
  String path;
  String name;
  RouteItem(this.path, this.name);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        "/place_grid": (context) => PagePlaceGrid(),
        "/icon_button": (context) => PageIconButton(),
        "/select_button_list": (context) => const PageSelectButtonList(),
        "/image_card": (context) => const PageImageCard(),
        "/card": (context) => const PageCard(),
        "/app/movie/home": (context) => PageMovieHome(),
        "/app/movie/item": (context) => PageMovieItem(),
      },
      title: 'CXUI',

      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RouteItem> routes = [
    RouteItem("/place_grid", "Place Grid"),
    RouteItem("/icon_button", "Icon Button"),
    RouteItem("/select_button_list", "Select Button List"),
    RouteItem("/image_card", "ImageCard"),
    RouteItem("/card", "Card"),
    RouteItem("/slider_view", "Slider View"),
    RouteItem("/app/movie/home", "Movie"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        backgroundColor: CxConfig.primary,
        clipBehavior: Clip.antiAlias,
        leading: const Icon(Ionicons.apps_outline, size: 20),

        title: Text(widget.title),
        actions: const [
          Icon(
            Icons.message,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 100,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 0, bottom: 15, right: 15, left: 15),
              decoration: BoxDecoration(
                color: CxConfig.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hello CXUI !",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "a new flutter ui",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemBuilder: itemBuilder,
                separatorBuilder: separatorBuilder,
                itemCount: routes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: CxConfig.primary.withOpacity(0.1),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(4, 8), // changes position of shadow
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        // tileColor: Colors.white,
        // selectedTileColor: Colors.amber,

        hoverColor: Colors.transparent,
        // style: ListTileStyle.list,
        // shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.all(Radius.circular(10))),
        leading: Text(routes[index].name),
        trailing: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFFF8A01),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.white,
          ),
        ),
        //hoverColor: Colors.green,
        //focusColor: Colors.green[100],
        onTap: () {
          Navigator.pushNamed(context, routes[index].path);
        },
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    // return Container(height: 0, color: Colors.grey[200]);
    return Container(height: 16, color: Colors.transparent);
  }
}
