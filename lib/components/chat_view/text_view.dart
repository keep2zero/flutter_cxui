import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MessageSpan extends InlineSpan {
  @override
  void build(ParagraphBuilder builder,
      {TextScaler textScaler = TextScaler.noScaling,
      List<PlaceholderDimensions>? dimensions}) {}

  @override
  int? codeUnitAtVisitor(int index, Accumulator offset) {
    // TODO: implement codeUnitAtVisitor
    throw UnimplementedError();
  }

  @override
  RenderComparison compareTo(InlineSpan other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }

  @override
  void computeSemanticsInformation(
      List<InlineSpanSemanticsInformation> collector) {
    // TODO: implement computeSemanticsInformation
  }

  @override
  void computeToPlainText(StringBuffer buffer,
      {bool includeSemanticsLabels = true, bool includePlaceholders = true}) {
    // TODO: implement computeToPlainText
  }

  @override
  InlineSpan? getSpanForPositionVisitor(
      TextPosition position, Accumulator offset) {
    // TODO: implement getSpanForPositionVisitor
    throw UnimplementedError();
  }

  @override
  bool visitChildren(InlineSpanVisitor visitor) {
    // TODO: implement visitChildren
    throw UnimplementedError();
  }

  @override
  bool visitDirectChildren(InlineSpanVisitor visitor) {
    // TODO: implement visitDirectChildren
    throw UnimplementedError();
  }
}

class TextView extends StatelessWidget {
  const TextView({super.key, this.message = ""});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      strutStyle: StrutStyle(),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
