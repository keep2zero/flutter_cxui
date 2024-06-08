import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.data});
  final String? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: Container(
        // child: data == null ? Image.asset("name") : Image.network(data!),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
        child: PopupMenuButton(
          tooltip: "",
          // icon: const Icon(Icons.image),
          itemBuilder: (context) {
            List<PopupMenuItem> items = [];
            items.add(const PopupMenuItem(child: Text("存储为")));
            items.add(const PopupMenuItem(child: Text("打开")));
            items.add(const PopupMenuItem(child: Text("分享")));
            return items;
          },
          child: Image.network(data!),
        ),
      ),
    );
  }
}
