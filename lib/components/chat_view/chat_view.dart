import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/chat_view/file_view.dart';
import 'package:flutter_cxui/components/chat_view/image_view.dart';
import 'package:flutter_cxui/components/chat_view/text_view.dart';
// import 'package:popover/popover.dart';

import '../popover/popover.dart';
import 'arrow_path.dart';
import 'chat_data_item.dart';

// 文本
// 图片
// 视频
// 链接
// 小程序
//
class CxChatView extends StatefulWidget {
  const CxChatView({super.key, this.isDirect = false, this.data});

  final bool isDirect;
  final ChatDataItem? data;
  @override
  State<CxChatView> createState() => _CxChatViewState();
}

class _CxChatViewState extends State<CxChatView> {
  @override
  Widget build(BuildContext context) {
    final item = widget.data;

    Widget view = TextView(message: item?.message ?? "");
    Color bgcolor = Colors.green;
    if (item?.type == "image") {
      view = ImageView(data: item?.message ?? "");
    }
    if (item?.type == "file") {
      view = FileView(
        file: item?.url,
        size: item?.size,
        fileName: item?.message ?? "",
        fileType: item?.ext,
        config: const {
          "xlsx": FileViewConfig(color: Colors.green, short: "X", ext: ".xlsx"),
          "ppt": FileViewConfig(color: Colors.orange, short: "PPT", ext: ".ppt"),
          "word": FileViewConfig(color: Colors.blue, short: "W", ext: ".doc"),
          "zip": FileViewConfig(color: Colors.red, short: "ZIP", ext: ".zip"),
          "apk": FileViewConfig(color: Color.fromARGB(255, 3, 161, 48), short: "APK", ext: ".apk"),
        },
      );
      bgcolor = Colors.white;
    }

    //

    // const FileView(),

    return Container(
      // color: const Color.fromARGB(255, 236, 235, 235),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "2024年05月31日 12:00",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          Row(
            textDirection: widget.isDirect ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: widget.isDirect ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(item?.avatar ?? ""),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: widget.isDirect ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: widget.isDirect ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      item?.name ?? "辰汐",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    Builder(builder: (context) {
                      return InkWell(
                        onLongPress: () {
                          openPopover(
                            context: context,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minHeight: 30, minWidth: 50),
                          decoration: BoxDecoration(
                            color: bgcolor,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: const [
                              BoxShadow(),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: 1,
                                left: widget.isDirect ? null : -14,
                                right: widget.isDirect ? -14 : null,
                                child: ClipPath(
                                  clipper: ArrowClipper(position: widget.isDirect ? "right" : "left"),
                                  child: Container(
                                    width: 6, //6
                                    height: 8, //8
                                    color: bgcolor,
                                  ),
                                ),
                              ),
                              view
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
