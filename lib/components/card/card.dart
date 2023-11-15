import 'package:flutter/material.dart';

class CxCard extends StatelessWidget {
  CxCard({
    super.key,
    this.radius,
    this.margin,
    this.title,
    this.titleColor,
    this.subtitle,
    this.subtitleColor,
    this.titleSize,
    this.subtitleSize,
    this.foot,
    required this.body,
    this.actions,
    this.bgColor,
    this.minHeight,
    this.footWidget,
    this.hdBgColor,
    this.hdPadding,
    //
    this.hdSplit,
    this.hdSplitColor,
    this.hdSplitHeight,
    this.hdSplitMargin,
    this.hdSplitWidget,
  });

  double? radius;
  EdgeInsetsGeometry? margin;

  Widget body;
  Widget? foot;
  Color? hdBgColor;
  EdgeInsetsGeometry? hdPadding;

  Widget? titleWidget;
  String? title;
  String? subtitle;
  double? titleSize;
  double? subtitleSize;
  double? minHeight;
  Color? bgColor;
  Color? titleColor;
  Color? subtitleColor;
  List<Widget>? actions;

  Widget? footWidget;

  final Widget? hdSplitWidget;
  final bool? hdSplit;
  final double? hdSplitHeight;
  final EdgeInsetsGeometry? hdSplitMargin;
  final Color? hdSplitColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (title != null || actions != null) {
      children.add(buildHd(context));
    }

    if (hdSplitWidget != null) {
      children.add(hdSplitWidget!);
    }

    if (hdSplitWidget == null && hdSplit != null && hdSplit!) {
      children.add(
        Container(
          margin: hdSplitMargin,
          height: hdSplitHeight ?? 1,
          color: hdSplitColor ?? Colors.grey[100],
        ),
      );
    }

    children.add(buildBd(context));

    if (foot != null) {
      children.add(buildFt());
    }

    Widget box = Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 80,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0),
        ),
      ),
      child: Column(
        children: children,
      ),
    );

    if (margin != null) {
      box = Padding(
        padding: margin!,
        child: box,
      );
    }

    return box;
  }

  Widget buildHd(BuildContext context) {
    final theme = Theme.of(context);
    final hds = <Widget>[];

    final titles = Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
    if (title != null) {
      titles.children.add(
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: titleSize ?? 14,
            color: titleColor ?? theme.cardTheme.color,
          ),
        ),
      );
    }

    if (subtitle != null) {
      titles.children.add(
        Text(
          subtitle ?? "",
          style: TextStyle(
            fontSize: subtitleSize ?? 12,
            color: subtitleColor ?? theme.hintColor,
          ),
        ),
      );
    }

    if (titles.children.isNotEmpty) {
      hds.add(titles);
    }
    return titleWidget ??
        Container(
          padding: hdPadding ?? const EdgeInsets.all(8),
          color: hdBgColor ?? Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: hds,
              ),
              Row(
                children: actions ?? [],
              )
            ],
          ),
        );
  }

  Widget buildBd(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Theme.of(context).colorScheme.surface.withAlpha(100),
      padding: const EdgeInsets.all(8),
      child: body,
    );
  }

  Widget buildFt() {
    return footWidget ??
        Container(
          color: Colors.amber,
          constraints:
              foot != null ? const BoxConstraints(minHeight: 20) : null,
          child: foot,
        );
  }
}
