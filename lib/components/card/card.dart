import 'package:flutter/material.dart';

class CxCard extends StatelessWidget {
  const CxCard({
    super.key,
    this.radius,
    this.margin,
    this.shadow,
    this.boxShadow,
    this.shadowColor,
    this.title,
    this.titleColor,
    this.subtitle,
    this.subtitleColor,
    this.titleSize,
    this.subtitleSize,
    this.titleWidget,
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

  /// Card圆角属性，默认是`0`。
  /// 圆角是控制四个角的，目前无法单独控制某个角。
  final double? radius;

  /// 外边距的控制，类型[EdgeInsetsGeometry], 通过调用该类的方法来控制其外边距
  final EdgeInsetsGeometry? margin;

  /// 盒子阴影。这个属性是由用户自己设置阴影。
  /// 它与默认阴影控制，只能二选一。
  final BoxShadow? boxShadow;

  /// 默认盒子阴影颜色。
  /// 默认颜色为 `Colors.grey.withAlpha(160)`
  final Color? shadowColor;

  /// 是否开启盒子阴影。
  /// 默认为 `false`
  final bool? shadow;

  /// Card的主区域部分， 这个是必须参数。类型为[Widget]
  final Widget body;

  /// Card的尾部组件。这个不是必须的。 类型为[Widget]
  final Widget? foot;

  /// Card的头部组件的背景色。默认为`透明色`.
  final Color? hdBgColor;

  /// Card的头部组件的内间隙. 默认为`8`个像素间隙。
  final EdgeInsetsGeometry? hdPadding;

  /// Card头部组件。 如果设置了titleWidget, 则默认的头部组件将被覆盖。头部由用户自己控制。
  final Widget? titleWidget;

  /// Card的标题。
  final String? title;

  /// Card的子标题
  final String? subtitle;

  /// 标题的大小。 默认大小为`14`
  final double? titleSize;

  /// 子标题大小. 默认大小为`12`
  final double? subtitleSize;

  /// 盒子的最小高度。 默认为 `80`.
  final double? minHeight;

  /// 盒子背景色。默认为 `Theme.of(context).colorScheme.background`
  final Color? bgColor;

  /// 标题颜色。默认为主题色的 `cardTheme.color`
  final Color? titleColor;

  /// 子标题颜色。 默认为主题色的`hintColor`
  final Color? subtitleColor;

  /// 默认头部组件的右边元素项。
  final List<Widget>? actions;

  /// footWidget与foot二选一。footWidget优先。
  final Widget? footWidget;

  /// 头部组件的底部分割组件。这个和默认分割组件，二选一.
  final Widget? hdSplitWidget;

  /// 是否显示分割组件. 默认不显示。
  final bool? hdSplit;

  /// 默认分割组件的高度.默认为`1`.
  final double? hdSplitHeight;

  /// 默认分割组件的外边距.
  final EdgeInsetsGeometry? hdSplitMargin;

  /// 分割组件的颜色. 默认颜色为`Colors.grey[100]`
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

    final shadows = <BoxShadow>[];
    if (boxShadow == null && shadow != null && shadow!) {
      shadows.add(
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 3,
          spreadRadius: 1,
          color: shadowColor ?? Colors.grey.withAlpha(160),
        ),
      );
    }

    if (boxShadow != null) {
      shadows.add(boxShadow!);
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
        boxShadow: shadows,
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

    const titles = Column(
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
