import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cxui/components/chat_view/chat_avatar.dart';
import 'package:flutter_cxui/components/chat_view/file_view.dart';
import 'package:flutter_cxui/components/chat_view/image_view.dart';
import 'package:flutter_cxui/components/chat_view/text_view.dart';
import 'package:flutter_cxui/components/utils.dart';
// import 'package:popover/popover.dart';
import 'package:intl/intl.dart' as intl;
import 'package:share_plus/share_plus.dart';
import '../popover/popover.dart';
import 'arrow_path.dart';
import 'chat_action.dart';
import 'chat_data_item.dart';

final Map<String, FileViewConfig> fileTypeMap = {
  "xlsx": const FileViewConfig(color: Colors.green, short: "X", ext: ".xlsx"),
  "ppt": const FileViewConfig(color: Colors.orange, short: "PPT", ext: ".ppt"),
  "word": const FileViewConfig(color: Colors.blue, short: "W", ext: ".doc"),
  "zip": const FileViewConfig(color: Colors.red, short: "ZIP", ext: ".zip"),
  "apk": const FileViewConfig(
      color: Color.fromARGB(255, 3, 161, 48), short: "APK", ext: ".apk"),
};

final List<ChatAction> actions = [
  ChatAction(
    type: const ["text", "link"],
    icon: Icons.copy,
    dismiss: true,
    onPressed: (item, {extra}) async {
      // Navigator.of(context).pop();
      await Clipboard.setData(
        ClipboardData(text: item.message ?? ""),
      );
    },
    label: "复制",
  ),
  ChatAction(
    type: const ["text", "link", "file", "image", "video"],
    icon: Icons.share,
    onPressed: (item, {extra}) {
      Share.share(item.message ?? "", subject: "辰汐助手").then((result) {
        log("分享成功");
      }, onError: (err) {
        log("$err");
      });
    },
    label: "分享",
  ),
  ChatAction(
    type: const ["link", "file", "image", "video"],
    icon: Icons.download,
    onPressed: (item, {extra}) {},
    label: "下载",
  ),
  ChatAction(
    type: const ["image", "video"],
    icon: Icons.cast,
    onPressed: (item, {extra}) {},
    label: "投屏",
  ),
];

// 文本
// 图片
// 视频
// 链接
// 小程序
//
class CxChatView extends StatefulWidget {
  const CxChatView(
      {super.key,
      this.isDirect = false,
      this.data,
      this.showTime = true,
      this.contentMenus,
      this.defaultAvatar = "",
      this.onPress,
      this.menuHeight = 50,
      this.menusSplit = 6,
      this.extraData,
      this.reserve = false});

  final bool isDirect;
  final bool showTime;
  final ChatDataItem? data;
  final List<Widget>? contentMenus;
  final int menusSplit;
  final bool reserve;

  final int menuHeight;
  final String defaultAvatar;
  final dynamic extraData;
  final void Function(ChatDataItem, {dynamic extra})? onPress;
  @override
  State<CxChatView> createState() => _CxChatViewState();
}

class _CxChatViewState extends State<CxChatView> {
  openContextMenu(BuildContext context) {
    openPopover(
      target: context,
      isDirect: widget.isDirect,
      offsetX: 50,
      items: widget.contentMenus,
      itemHeight: widget.menuHeight,
      splitSize: widget.menusSplit,
      // context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.data;

    Widget view = TextView(message: item?.message ?? "");
    Color bgcolor = Colors.white;
    if (widget.isDirect) {
      bgcolor = const Color.fromARGB(255, 158, 234, 106);
    }

    if (item?.type == "image" ||
        (item?.type == "text" &&
            LinkUtil.isLink(item?.message ?? "") &&
            FileUtil.isImage(item?.message ?? "")) ||
        (item?.type == "file" && FileUtil.isImage(item?.url ?? ""))) {
      String url = item?.url ?? "";
      if (item?.type == "text") {
        url = item?.message ?? "";
      }

      view = ImageView(data: url);
    }

    if (item?.type == "file" && !FileUtil.isImage(item?.url ?? "")) {
      view = FileView(
        file: item?.url,
        size: item?.size,
        fileName: item?.message ?? "",
        fileType: item?.ext,
        config: fileTypeMap,
      );
      bgcolor = Colors.white;
    }

    final date = DateTime.fromMillisecondsSinceEpoch(
        item?.time ?? DateTime.now().millisecondsSinceEpoch);
    final time = intl.DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
    // print(time);
    //

    // const FileView(),

    return Container(
      // color: const Color.fromARGB(255, 236, 235, 235),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          if (widget.showTime && !widget.reserve)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          Row(
            textDirection:
                widget.isDirect ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: widget.isDirect
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  // backgroundImage: ,
                  child: ChatAvatar(
                    placeholder: widget.defaultAvatar,
                    avatar: item?.avatar,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: widget.isDirect
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: widget.isDirect
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
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
                        onTap: () {
                          if (widget.onPress != null) {
                            widget.onPress!(item!, extra: widget.extraData);
                          }
                        },
                        onSecondaryTap: () {
                          // log("hello");
                          if (!Platform.isAndroid && !Platform.isIOS) {
                            openContextMenu(context);
                          }
                        },
                        onLongPress: () {
                          // List<Widget> items = [];
                          // for (var element in actions) {
                          //   if (element.type.contains(item!.type)) {
                          //     log("${element.type},,,,${item.type}");
                          //     items.add(element.build(context, item));
                          //   }
                          // }

                          if (Platform.isAndroid || Platform.isIOS) {
                            openContextMenu(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minHeight: 30, minWidth: 50),
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
                                  clipper: ArrowClipper(
                                      position:
                                          widget.isDirect ? "right" : "left"),
                                  child: Container(
                                    width: 6, //6
                                    height: 8, //8
                                    color: bgcolor,
                                  ),
                                ),
                              ),
                              view,
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
          if (widget.showTime && widget.reserve)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
