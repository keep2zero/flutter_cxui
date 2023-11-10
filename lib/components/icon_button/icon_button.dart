import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CxIconButton extends StatefulWidget {
  CxIconButton({super.key, this.icon, this.click, this.size, this.color});
  IconData? icon;
  double? size;
  Color? color;
  void Function()? click;

  @override
  State<CxIconButton> createState() => _CxIconButtonState();
}

class _CxIconButtonState extends State<CxIconButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MouseRegion(
      onEnter: (PointerEnterEvent e) {
        setState(() {
          hover = true;
        });
      },
      onExit: (PointerExitEvent e) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        child: Icon(
          widget.icon,
          size: widget.size ?? 16,
          color: hover ? theme.focusColor : widget.color,
        ),
        onTap: () {
          widget.click != null ? widget.click!() : ();
        },
      ),
    );
  }
}
