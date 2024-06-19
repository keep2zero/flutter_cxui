import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.data, this.onPress});
  final String? data;
  final Function(String?)? onPress;

  @override
  Widget build(BuildContext context) {
    final maxw = MediaQuery.of(context).size.width - 160;
    return Container(
      // child: data == null ? Image.asset("name") : Image.network(data!),
      constraints: BoxConstraints(maxWidth: maxw),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Image.network(data!),
    );
  }
}
