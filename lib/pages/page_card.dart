import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/icon_button/icon_button.dart';

class PageCard extends StatefulWidget {
  const PageCard({super.key});

  @override
  State<PageCard> createState() => _PageCardState();
}

class _PageCardState extends State<PageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Card"),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: CxCard(
                title: "明日之歌",
                actions: [
                  CxIconButton(
                    size: 20,
                    icon: Icons.delete,
                    click: () {
                      print("delete state");
                    },
                  ),
                ],
                body: Container(
                  height: 80,
                  child: LayoutBuilder(builder: (context, BoxConstraints bc) {
                    return GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: bc.maxWidth / bc.maxHeight,
                        mainAxisSpacing: 10,
                      ),
                      children: [
                        Container(
                            color: Colors.amber,
                            child: const Center(
                              child: Text("01"),
                            )),
                        Container(
                          color: Colors.blue,
                          child: const Center(
                            child: Text("02"),
                          ),
                        ),
                        Container(
                          color: Colors.pink,
                          child: const Center(
                            child: Text("03"),
                          ),
                        ),
                        Container(
                          color: Colors.orange,
                          child: const Center(
                            child: Text("04"),
                          ),
                        ),
                        Container(
                          color: Colors.purple,
                          child: const Center(
                            child: Text("05"),
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: const Center(
                            child: Text("06"),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: CxCard(
                title: "您好",
                body: const Text("主题内容"),
              ),
            ),
          ],
        ));
  }
}
