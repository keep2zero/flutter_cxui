import 'dart:io';

import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(6),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      // color: Colors.black,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // padding: EdgeInsets.all(8),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: const Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img/card-img-01.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "清风落叶",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "拽姐英子一秒黑脸",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
