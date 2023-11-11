import 'package:flutter/material.dart';

class CxSliderView extends StatefulWidget {
  const CxSliderView({super.key});

  @override
  State<CxSliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<CxSliderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              //color: Colors.white,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
