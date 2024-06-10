import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.data});
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: data == null ? Image.asset("name") : Image.network(data!),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Image.network(data!),
    );
  }
}
