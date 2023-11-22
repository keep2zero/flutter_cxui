import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/button/button.dart';

void main() {
  runApp(const PageButtonApp());
}

class PageButtonApp extends StatelessWidget {
  const PageButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CxButton(),
    );
  }
}
