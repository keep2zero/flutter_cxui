import 'package:flutter/material.dart';

class CXUI {
  static show(BuildContext context, String type, String msg) {
    Color bg = Colors.black54;
    if (type == "success") {
      bg = Colors.green;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10,
        ),
        content: Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8),),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(msg, style: const TextStyle(fontSize: 12),),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static success(BuildContext context, String msg) {
    CXUI.show(context, "success", msg);
  }
}
