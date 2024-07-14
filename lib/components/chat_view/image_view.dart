import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/utils.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.data, this.onPress, this.loadingSize = 0, this.size = 0});
  final String? data;
  final int loadingSize;
  final int size;
  final Function(String?)? onPress;

  @override
  Widget build(BuildContext context) {
    final maxw = MediaQuery.of(context).size.width - 160;

    final img = LinkUtil.isHttp(data!) ? NetworkImage(data!) : Image.file(File(data!)).image;
    log("the show image: $data, ------ $img");
    double loadingValue = 0;
    if (size > 0) {
      loadingValue = loadingSize / size;
    }

    bool isLoading = loadingSize < size && size > 0 && loadingValue > 0;
    // bool isComplete = loadingSize >= size && size > 0;

    return Stack(
      children: [
        imgContainer(maxw, img),
        if (isLoading)
          Positioned(
            bottom: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  value: loadingValue,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Container imgContainer(double maxw, ImageProvider img) {
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
