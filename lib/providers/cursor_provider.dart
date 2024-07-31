import 'package:flutter/material.dart'
    show BoxDecoration, ChangeNotifier, GlobalKey, Offset, RenderBox;
import '../utils/cursor_state.dart';

class CursorProvider extends ChangeNotifier {
  CursorState state = CursorState();

  void changeCursor(GlobalKey key, {BoxDecoration? decoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    state = CursorState(
      size: renderBox.size,
      offset: renderBox.localToGlobal(Offset.zero).translate(
            renderBox.size.width / 2,
            renderBox.size.height / 2,
          ),
      decoration: decoration ?? CursorState.kDefaultDecoration,
    );

    notifyListeners();
  }

  void resetCursor() {
    state = CursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset position) {
    state = CursorState(offset: position);
    notifyListeners();
  }
}
