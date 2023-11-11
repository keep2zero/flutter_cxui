import 'package:flutter/material.dart';

class CxSliderView extends StatefulWidget {
  CxSliderView({super.key, required this.objects});

  @override
  State<CxSliderView> createState() => _SliderViewState();

  List<SliderObject> objects;
}

class SliderObject {
  String objName;
  String objCover;
  SliderObject(this.objName, this.objCover);
}

class _SliderViewState extends State<CxSliderView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Container(
              width: double.infinity,
              height: 180,
              color: Colors.red,
              child: Image.network(
                widget.objects[index].objCover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //color: Colors.white,
                height: 20,
                child: Builder(builder: (context) {
                  List<Widget> children = [];
                  for (int i = 0; i < widget.objects.length; i++) {
                    children.add(
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = i;
                          });
                        },
                        child: Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 2),
                          decoration: BoxDecoration(
                            color: index == i ? Colors.white : Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
