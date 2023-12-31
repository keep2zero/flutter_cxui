import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

class PageImageCard extends StatelessWidget {
  const PageImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Card"),
      ),
      body: GridView.builder(
        // shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.all(6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return CxImageCard(
      title: "清风落叶",
      subtitle: "又一个神剧",
      img: "assets/img/card-img-01.jpg",
      topLeft: const [
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.hotel_class,
          color: Colors.amberAccent,
          size: 16,
        ),
      ],
      topRight: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          padding: const EdgeInsets.only(left: 5, right: 5),
          height: double.infinity,
          child: const Center(
            child: Text(
              "独播",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
      bottomRight: const [
        Text(
          "16集全",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        SizedBox(width: 5),
      ],
      bottomLeft: [
        Container(
          // margin: EdgeInsets.all(5),
          // padding: EdgeInsets.all(5),

          decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: const Text(
              "电视机",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
