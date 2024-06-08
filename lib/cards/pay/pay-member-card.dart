import 'package:flutter/material.dart';

class CxPayMemberCardData {
  final String? title;
  final String? intro;
  final String? price;
  final String? priceDesc;
  const CxPayMemberCardData({this.title, this.intro, this.price, this.priceDesc});
}

class CxPayMemberCard extends StatefulWidget {
  final List<CxPayMemberCardData> data;
  final int index;
  final void Function(int)? onChange;

  final Color? selectColor;

  const CxPayMemberCard(this.data, {super.key, this.index = 0, this.onChange, this.selectColor = Colors.amber});

  @override
  State<CxPayMemberCard> createState() => _CxPayMemberCardState();
}

class _CxPayMemberCardState extends State<CxPayMemberCard> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 160,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final item = widget.data[index];

          return GestureDetector(
            onTap: () {
              widget.onChange ?? (index);
              setState(() {
                select = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              clipBehavior: Clip.none,
              width: 160,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: select == index ? widget.selectColor?.withAlpha(30) : Colors.white,
                        border: Border.all(
                          color: select == index ? widget.selectColor! : const Color.fromARGB(255, 233, 232, 232),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            item.title ?? "",
                            style: TextStyle(color: select == index ? widget.selectColor : Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "¥",
                                style: TextStyle(color: select == index ? widget.selectColor : Colors.black),
                              ),
                              Text(
                                item.price ?? "0",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: select == index ? widget.selectColor : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(item.intro ?? "", style: TextStyle(color: select == index ? widget.selectColor : Colors.grey[400])),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "限时优惠",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
