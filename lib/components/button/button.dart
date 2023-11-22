import 'package:flutter/material.dart';

class CxButton extends StatefulWidget {
  const CxButton({super.key});

  @override
  State<CxButton> createState() => _CxButtonState();
}

class _CxButtonState extends State<CxButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        // onPressed: () {},
        child: const Text("hello"),
      ),
    );
  }
}
