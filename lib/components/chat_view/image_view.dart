import 'dart:developer';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.data, this.onPress});
  final String? data;
  final Function(String?)? onPress;

  @override
  Widget build(BuildContext context) {
    final maxw = MediaQuery.of(context).size.width - 160;

    final img = NetworkImage(data!);

    return Container(
      // child: data == null ? Image.asset("name") : Image.network(data!),
      constraints: BoxConstraints(maxWidth: maxw),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Image(
        image: ResizeImage(img, height: 150),
        loadingBuilder: (context, child, loadingProgress) {
          double? loaded = loadingProgress?.cumulativeBytesLoaded.toDouble();
          if (loadingProgress?.expectedTotalBytes != null) {
            loaded = loaded! / loadingProgress!.expectedTotalBytes!;
          } else {
            loaded = null;
          }
          // log("image-loading: $loadingProgress");
          return loadingProgress == null
              ? child
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.grey,
                    value: loaded,
                  ),
                ));
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("加载失败"),
            ),
          );
        },
      ),
    );
  }
}
