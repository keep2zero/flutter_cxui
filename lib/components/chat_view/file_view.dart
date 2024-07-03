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
    this.size,
    this.loadingSize,
    this.fileName,
    this.config,
    this.fileType,
  });
  final String? file;
  final String? fileName;
  final int? size;
  final int? loadingSize;
  final String? fileType;
  final Map<String, FileViewConfig>? config;
  @override
  Widget build(BuildContext context) {
    final filevc = config?[fileType];
    double? loadingValue;
    if (loadingSize != null && size != null) {
      loadingValue = loadingSize! / size!;
    }
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
                      "${size ?? 0}",
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
                    type: filevc?.short ?? "",
                    color: filevc?.color ?? Colors.red,
                  ),
                  if (loadingValue != null)
                    Positioned.fill(
                      child: Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(value: loadingValue),
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
          Text(
            filevc?.ext ?? "",
            style: TextStyle(color: filevc?.color ?? Colors.red),
          ),
        ],
      ),
    );
  }
}
