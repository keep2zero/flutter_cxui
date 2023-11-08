import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/select_button_list/select_button_list.dart';
import 'package:flutter_cxui/pages/page_select_button_list.dart';

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
      },
      title: 'Flutter CXUI DEMO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
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
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
      hoverColor: Colors.green,
      focusColor: Colors.green[100],
      onTap: () {
        Navigator.pushNamed(context, routes[index].path);
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider();
  }
}
