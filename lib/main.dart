import 'package:flutter/material.dart';
import 'package:flutter_cxui/pages/page_card.dart';
import 'package:flutter_cxui/pages/page_select_button_list.dart';

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
      // onGenerateRoute: (RouteSettings setting) {

      // },
      routes: {
        "/select_button_list": (context) => const PageSelectButtonList(),
        "/image_card": (context) => const PageImageCard(),
        "/card": (context) => const PageCard(),
      },
      title: 'Flutter CXUI DEMO',
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'Flutter CXUI DEMO'),
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
    RouteItem("/select_button_list", "Select Button List"),
    RouteItem("/image_card", "ImageCard"),
    RouteItem("/card", "Card"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: routes.length,
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Text(routes[index].name),
      trailing: Icon(Icons.arrow_forward_ios),
      //hoverColor: Colors.green,
      //focusColor: Colors.green[100],
      onTap: () {
        Navigator.pushNamed(context, routes[index].path);
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider();
  }
}
