import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/slider_view/slider_view.dart';

class PageSliderView extends StatelessWidget {
  const PageSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slider View")),
      body: CxSliderView(
        height: 150,
        onTap: (SliderObject obj, int index) {
          // print("click the item $index");
        },
        objects: [
          SliderObject("海豹看看",
              "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200q7mndle1664438925875/332?max_age=7776001"),
          SliderObject("故宫里的大怪兽之莫奈何的谜题",
              "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200ap8s2p31697455490020/332?max_age=7776001"),
          SliderObject("小不点.....",
              "https://puui.qpic.cn/vpic_cover/m0038bibwlq/m0038bibwlq_hz.jpg/640"),
        ],
      ),
    );
  }
}
