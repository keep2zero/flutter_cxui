import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key, required this.placeholder, this.avatar});
  final String placeholder;
  final String? avatar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      child: FadeInImage.assetNetwork(
        placeholder: placeholder,
        image: avatar ?? "",
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(placeholder);
        },
      ),
    );
  }
}
