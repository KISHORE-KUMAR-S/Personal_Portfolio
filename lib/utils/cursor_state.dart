import 'package:flutter/material.dart'
    show Border, BoxDecoration, BoxShape, Colors, Offset, Size;

class CursorState {
  late final BoxDecoration decoration;
  final Offset offset;
  final Size size;

  static const Size kDefaultSize = Size(60, 60);
  static final BoxDecoration kDefaultDecoration = BoxDecoration(
    border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
    shape: BoxShape.circle,
  );

  CursorState({
    this.offset = Offset.zero,
    this.size = kDefaultSize,
    BoxDecoration? decoration,
  }) {
    this.decoration = decoration ?? kDefaultDecoration;
  }
}
