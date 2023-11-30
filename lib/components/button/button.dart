// import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

/// Button Component
///
/// Button has two states that they are solid and fill. Set the value of type property.
///
/// **Demo:**
///
/// ```dart
///   CxButton(
///      text: "Wechat",
///      type: CxButtonType.fill,
///      icon: Icons.wechat,
///      color: Colors.green,
///   )
/// ```
///
class CxButton extends StatefulWidget {
  const CxButton({
    super.key,
    this.text,
    this.icon,
    this.type = CxButtonType.solid,
    this.color = const Color.fromARGB(255, 50, 73, 245),
    this.textColor,
    this.iconColor,
    this.radius = 20,
    this.padding = const EdgeInsets.all(8),
    this.iconSize,
    this.textSize,
    this.shadow = true,
    this.width,
    this.height,
    this.disabled = false,
    this.onTap,
  });

  /// the state of disabled. default `false`
  final bool disabled;

  /// button width.
  final double? width;

  /// button height.
  final double? height;

  ///whether to enable box shadow. default true.
  final bool shadow;

  /// button padding. default 8.
  final EdgeInsetsGeometry? padding;

  /// border radius. default 20.
  final double? radius;

  /// button label.
  final String? text;

  /// icon data.
  final IconData? icon;

  ///icon size. default 16.
  final double? iconSize;

  /// text size. default 12.
  final double? textSize;

  /// button type. `fill` and `solid` are the two states of the button.
  final CxButtonType? type;

  /// button color. default is blue.
  final Color? color;

  /// the label color. default is white.
  final Color? textColor;

  /// the icon color. default is white.
  final Color? iconColor;

  /// click event.
  final void Function()? onTap;

  @override
  State<CxButton> createState() => _CxButtonState();
}

class _CxButtonState extends State<CxButton> {
  int index = 0;
  Future? delay;
  @override
  Widget build(BuildContext context) {
    const defcolor = Color.fromARGB(255, 255, 255, 255);
    Color color = index == 0 ? widget.color! : widget.color!.withAlpha(180);

    final diconColor = widget.iconColor ??
        (widget.type == CxButtonType.fill ? defcolor : color);
    final dtextColor = widget.textColor ??
        (widget.type == CxButtonType.fill ? defcolor : color);

    Color iconColor = index == 0 ? diconColor : diconColor.withAlpha(100);
    Color textColor = index == 0 ? dtextColor : dtextColor.withAlpha(100);
    if (widget.disabled) {
      color = Color.fromARGB(255, 225, 225, 225);
      textColor = Color.fromARGB(255, 160, 159, 159);
      iconColor = Color.fromARGB(255, 160, 159, 159);
    }

    List<BoxShadow> bslist = [];
    if (index == 1 && widget.shadow) {
      bslist.add(
        BoxShadow(
          color: color.withAlpha(180),
          // offset: Offset(2, 2),
          spreadRadius: 3,
          blurRadius: 2,
          blurStyle: BlurStyle.solid,
        ),
      );
    }

    final deco = BoxDecoration(
      color: (widget.type == CxButtonType.fill || index == 1) ? color : null,
      border:
          widget.type == CxButtonType.solid ? Border.all(color: color) : null,
      borderRadius: BorderRadius.circular(widget.radius!),
      boxShadow: bslist,
    );

    return Stack(
      children: [
        buildBody(deco, iconColor, textColor),

        ////////////////////////////////
        // Positioned.fill(
        //   child:
        // )
      ],
    );
  }

  void lockup() {
    if (widget.disabled) return;
    if (delay != null) return;

    delay = Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
      setState(() {
        index = 0;
        delay = null;
      });
    });
  }

  Widget buildBody(BoxDecoration deco, Color iconColor, Color textColor) {
    return GestureDetector(
      onTap: () {
        if (widget.disabled) return;
        if (widget.onTap != null) widget.onTap!();
      },
      onTapDown: (detail) {
        if (widget.disabled) return;
        if (delay == null) {
          setState(() {
            index = 1;
          });
        }
      },
      onLongPress: () => lockup(),
      onTapUp: (detail) => lockup(),
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: deco,
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: iconColor,
                size: widget.iconSize ?? 16,
              ),
            if (widget.text != null || widget.icon != null)
              const SizedBox(
                width: 2,
              ),
            if (widget.text != null)
              Text(
                widget.text!,
                style: TextStyle(
                    color: textColor, fontSize: widget.textSize ?? 12),
              ),
          ],
        ),
      ),
    );
  }
}

/// Button type. it's `enum` type.
enum CxButtonType { fill, solid, text }
