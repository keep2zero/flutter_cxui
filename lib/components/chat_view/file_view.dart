import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_cxui/components/chat_view/chat_file_type.dart';
import 'package:flutter_cxui/components/context_menu/context_menu.dart';

class FileViewConfig {
  final String? ext;
  final Color? color;
  final String? short;
  const FileViewConfig({this.ext, this.color, this.short});
}

class FileView extends StatelessWidget {
  const FileView({
    super.key,
    this.file,
    this.size = 0,
    this.loadingSize = 0,
    this.fileName,
    this.config,
    this.fileType,
  });
  final String? file;
  final String? fileName;
  final int size;
  final int loadingSize;
  final String? fileType;
  final Map<String, FileViewConfig>? config;
  @override
  Widget build(BuildContext context) {
    final filevc = config?[fileType] ?? FileViewConfig(ext: ".$fileType", color: Color.fromARGB(255, 247, 120, 120), short: "${fileType?.toLowerCase()}");
    double loadingValue = 0;
    if (size > 0) {
      loadingValue = loadingSize / size;
    }

    bool isLoading = loadingSize < size && size > 0 && loadingValue > 0;
    bool isComplete = loadingSize >= size && size > 0;
    log("the is loading: $isLoading, isComplete: $isComplete, loadingValue: $loadingValue, size: $size, loadingSize: $loadingSize");

    return Container(
      constraints: const BoxConstraints(maxWidth: 220),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${(size / 1024).toStringAsFixed(2)}kb",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  ChatFileType(
                    type: filevc.short ?? "",
                    color: filevc.color ?? Colors.red,
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            value: loadingValue,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color.fromARGB(255, 247, 245, 245),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filevc.ext ?? "",
                style: TextStyle(color: filevc.color ?? Colors.red),
              ),
              Row(
                //isComplete ? const Icon(Icons.check) : Text("${(loadingValue * 100).floor()}%")
                children: [isComplete ? const Icon(Icons.check) : const Text(""), const Text("")],
              )
            ],
          ),
        ],
      ),
    );
  }
}
