import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:personal_portfolio/providers/cursor_provider.dart';

class CursorWidget extends StatelessWidget {
  final Widget? child;
  const CursorWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CursorProvider(),
      child: Consumer<CursorProvider>(
        builder: (context, cursorProvider, child) {
          final state = cursorProvider.state;
          return Stack(
            children: [
              if (child != null) child,
              _buildMouseRegion(context),
              _buildAnimatedCursor(state),
              // ResumeDownloadButton(),
              _buildCursorCircle(state),
            ],
          );
        },
        child: child,
      ),
    );
  }

  Widget _buildMouseRegion(BuildContext context) {
    return Positioned.fill(
      child: MouseRegion(
        opaque: false,
        onHover: (event) => _onCursorUpdate(event, context),
      ),
    );
  }

  Widget _buildAnimatedCursor(state) {
    return Visibility(
      visible: state.offset != Offset.zero,
      child: AnimatedPositioned(
        left: state.offset.dx - state.size.width / 2,
        top: state.offset.dy - state.size.height / 2,
        width: state.size.width,
        height: state.size.height,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        child: IgnorePointer(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            width: state.size.width,
            height: state.size.height,
            decoration: state.decoration,
          ),
        ),
      ),
    );
  }

  Widget _buildCursorCircle(state) {
    return Visibility(
      visible: state.offset != Offset.zero,
      child: AnimatedPositioned(
        left: state.offset.dx - state.size.width / 2,
        top: state.offset.dy - state.size.height / 2,
        duration: const Duration(milliseconds: 50),
        child: IgnorePointer(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            width: state.size.width,
            height: state.size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  void _onCursorUpdate(PointerEvent event, BuildContext context) {
    context.read<CursorProvider>().updateCursorPosition(event.position);
  }
}
