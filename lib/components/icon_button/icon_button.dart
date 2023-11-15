import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final IconData? icon;
  final double? size;
  final Color? color;
  final Color? bgColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? clickColor;
  final double? padding;
  final void Function()? click;

  @override
  State<CxIconButton> createState() => _CxIconButtonState();
}

class _CxIconButtonState extends State<CxIconButton> {
  int hover = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

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
            widget.click != null ? widget.click!() : ();
          },
        ),
      ),
    );
  }
}
