import 'package:flutter/material.dart';

class ZoomInOnHover extends StatefulWidget {
  final Widget child;

  const ZoomInOnHover({super.key, required this.child});

  @override
  _ZoomInOnHoverState createState() => _ZoomInOnHoverState();
}

class _ZoomInOnHoverState extends State<ZoomInOnHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered ? Matrix4.skewY(0.0) : null,
        child: widget.child,
      ),
    );
  }
}
