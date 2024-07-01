import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cxui/components/chat_view/chat_data_item.dart';

// CXUI.success(context, "复制完成");
// Navigator.of(context).pop();
// await Clipboard.setData(
//   ClipboardData(text: item?.message ?? ""),
// );
class ChatAction {
  const ChatAction({
    required this.type,
    this.onPressed,
    required this.icon,
    this.label,
    this.dismiss = false,
    this.filter,
  });

  final List<String> type;
  final void Function(ChatDataItem, {Object? extra})? onPressed;
  final bool Function(ChatDataItem, {Object? extra})? filter;
  final IconData icon;
  final String? label;
  final bool dismiss;

  Widget build(BuildContext context, ChatDataItem item, {dynamic extra}) {
    return Container(
      child: Column(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero)),
            onPressed: () {
              if (dismiss) Navigator.of(context).pop();
              if (onPressed != null) {
                onPressed!(item, extra: extra);
              }
            },
            icon: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          if (label != null)
            Text(
              label ?? "",
              style: const TextStyle(
                  fontSize: 12, color: Colors.white, inherit: false),
            ),
        ],
      ),
    );
  }
}
