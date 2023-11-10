import 'package:flutter/material.dart';

class CxCard extends StatelessWidget {
  CxCard(
      {super.key,
      this.title,
      this.titleSize,
      this.foot,
      required this.body,
      this.actions,
      this.minHeight});
  Widget body;
  Widget? foot;
  String? title;
  double? titleSize;
  double? minHeight;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (title != null || actions != null) {
      children.add(buildHd(context));
    }
    children.add(buildBd(context));

    if (foot != null) {
      children.add(buildFt());
    }

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: BoxConstraints(minHeight: minHeight ?? 80),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withAlpha(200),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget buildHd(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: this.titleSize ?? 14,
                    // color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: actions ?? [],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBd(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface.withAlpha(100),
      padding: const EdgeInsets.all(8),
      child: body,
    );
  }

  Widget buildFt() {
    return Container(
      constraints: foot != null ? const BoxConstraints(minHeight: 20) : null,
      child: foot,
    );
  }
}
