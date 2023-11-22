import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Icon Button Component.
/// The Icon is too simple that gives it click event.
/// The Icon has more properties. It includes icon, size, color, hoverColor, focusColor, padding, bgColor.
/// {@tool snippet}
///
/// ```dart
/// CxIconButton(
///  icon: Icons.heart,
///  size: 24,
///  bgColor: Colors.pink,
///  color: Colors.white,
/// )
/// ```
///
/// {@end-tool}
class CxIconButton extends StatefulWidget {
  const CxIconButton({
    super.key,
    this.icon,
    this.click,
    this.size,
    this.color,
    this.hoverColor,
    this.focusColor,
    this.clickColor,
    this.padding,
    this.bgColor,
  });

  /// icon is [IconData] object. You should use [Icons] or other [IconData] libraries.
  final IconData? icon;

  /// it sets size of the icon. Default is `16`.
  final double? size;

  /// color of the icon. Default is `Colors.black`.
  final Color? color;

  /// the background color of the icon.
  final Color? bgColor;

  /// color of the hover state for icon. Default is `Colors.black.withAlpha(200)`.
  final Color? hoverColor;

  /// color of the focus state for icon. Default is `Colors.black.withAlpha(100)`.
  final Color? focusColor;

  /// color of the click state for icon. Default is `Colors.black87`.
  final Color? clickColor;

  /// icon's margin space. Default is `6`;
  final double? padding;

  /// icons's click event.
  final void Function()? click;

  @override
  State<CxIconButton> createState() => _CxIconButtonState();
}

class _CxIconButtonState extends State<CxIconButton> {
  int hover = 0;

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);

    late Color color;

    switch (hover) {
      case 0:
        color = widget.color ?? Colors.black;
      case 1:
        color = widget.hoverColor ?? Colors.black.withAlpha(200);
      case 2:
        color = widget.focusColor ?? Colors.black.withAlpha(100);
      case 3:
        color = widget.clickColor ?? Colors.black87;
    }

    double radius = widget.size ?? 16;
    if (widget.size != null) {
      double p = widget.padding ?? 6;
      radius = widget.size!.toDouble() + p;
    }
    double p = widget.padding ?? 6;
    if (widget.bgColor == null) {
      p = 0;
    }

    return Container(
      padding: EdgeInsets.all(p),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MouseRegion(
        onEnter: (PointerEnterEvent e) {
          setState(() => hover = 1);
        },
        onExit: (PointerExitEvent e) {
          setState(() => hover = 0);
        },
        child: GestureDetector(
          onTapDown: (details) {
            setState(() => hover = 3);
          },
          onTapUp: (details) {
            setState(() => hover = 2);
          },
          child: Icon(
            widget.icon,
            size: widget.size ?? 16,
            color: color,
          ),
          onTap: () {
            if (widget.click != null) widget.click!();
          },
        ),
      ),
    );
  }
}
