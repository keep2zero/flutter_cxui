import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/icon_button/icon_button.dart';

class PageIconButton extends StatelessWidget {
  PageIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Icon Button")),
      body: CxCard(
        body: LayoutBuilder(builder: (context, BoxConstraints cons) {
          return Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                Container(
                  color: Colors.pink,
                  child: CxIconButton(
                    color: Colors.white,
                    icon: Icons.image,
                    size: 20,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: CxIconButton(
                    color: Colors.white60,
                    icon: Icons.yard_outlined,
                    size: 30,
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: CxIconButton(
                    color: Colors.red,
                    icon: Icons.dangerous,
                    size: 50,
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: CxIconButton(
                    color: Colors.lime,
                    icon: Icons.warning,
                    size: 30,
                  ),
                ),
                Container(
                  color: Colors.cyanAccent,
                  child: CxIconButton(
                    icon: Icons.ac_unit,
                    size: 36,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
