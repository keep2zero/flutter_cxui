import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/button/button.dart';
import 'package:flutter_cxui/cxui.dart';

void main() => runApp(const PageButtonApp());

class PageButtonApp extends StatelessWidget {
  const PageButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: const Text("CxButton"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.black,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  buildSolid(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildIcon(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextIcon(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildSize(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSolid() {
    return const CxCard(
      title: "Default",
      shadow: true,
      radius: 5,
      body: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CxButton(
            text: "hello",
            // padding: EdgeInsets.all(10),
          ),
          CxButton(
            text: "hello",
            color: Colors.pink,
            // padding: EdgeInsets.all(10),
          ),
          CxButton(
            type: CxButtonType.fill,
            text: "hello",
            color: Colors.purple,
            // padding: EdgeInsets.all(10),
          ),
          CxButton(
            text: "world",
            radius: 10,
            type: CxButtonType.fill,
          ),
        ],
      ),
    );
  }

  Widget buildIcon() {
    return const CxCard(
      shadow: true,
      radius: 5,
      title: "ICON",
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CxButton(
            color: Colors.pink,
            icon: Icons.home_filled,
            radius: 8,
          ),
          CxButton(
            radius: 10,
            type: CxButtonType.fill,
            color: Colors.green,
            icon: Icons.account_balance_rounded,
          ),
          CxButton(
            type: CxButtonType.fill,
            color: Colors.green,
            icon: Icons.wechat,
          ),
          CxButton(
            shadow: true,
            iconSize: 30,
            radius: 30,
            color: Colors.purple,
            type: CxButtonType.fill,
            icon: Icons.whatshot,
          ),
        ],
      ),
    );
  }

  Widget buildTextIcon() {
    return const CxCard(
      title: "Label and Icon",
      shadow: true,
      radius: 5,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CxButton(
            text: "Wechat",
            type: CxButtonType.fill,
            icon: Icons.wechat,
            color: Colors.green,
          ),
          CxButton(
            text: "Location",
            icon: Icons.location_on_outlined,
          ),
          CxButton(
            text: "Home",
            color: Colors.purple,
            type: CxButtonType.fill,
            icon: Icons.home,
          ),
        ],
      ),
    );
  }

  Widget buildSize() {
    return const CxCard(
      title: "Size",
      shadow: true,
      hdSplit: true,
      radius: 5,
      body: Align(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CxButton(
              text: "w 60",
              width: 60,
              type: CxButtonType.fill,
            ),
            CxButton(
              text: "w 160",
              width: 160,
              type: CxButtonType.fill,
            ),
            CxButton(
              text: "height 30",
              height: 30,
              color: Colors.amber,
              padding: EdgeInsets.all(0),
              type: CxButtonType.fill,
            ),
          ],
        ),
      ),
    );
  }
}
