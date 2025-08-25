import 'package:flutter/material.dart';

class FilledMdxButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final TextStyle textStyle;
  final bool enabled;
  final double initialRadius;
  final double pressedRadius;

  const FilledMdxButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
    this.enabled = true,
    this.initialRadius = 25.0,
    this.pressedRadius = 10.0,
  });

  @override
  State<FilledMdxButton> createState() => _FilledMdxButtonState();
}

class _FilledMdxButtonState extends State<FilledMdxButton> {
  double _radius = 25.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _radius = widget.pressedRadius;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _resetRadius();
    if (widget.enabled && widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    _resetRadius();
  }

  void _resetRadius() {
    setState(() {
      _radius = widget.initialRadius;
    });
  }

  @override
  void initState() {
    super.initState();
    _radius = widget.initialRadius;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled ? _onTapDown : null,
      onTapUp: widget.enabled ? _onTapUp : null,
      onTapCancel: widget.enabled ? _onTapCancel : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 550),
        curve: Curves.elasticOut,
        decoration: BoxDecoration(
          color: widget.enabled
              ? widget.color
              : const Color.fromARGB(255, 129, 129, 129),
          borderRadius: BorderRadius.circular(_radius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Center(
          child: Text(
            widget.text,
            style: widget.textStyle.copyWith(
              color: widget.enabled
                  ? Theme.of(context).colorScheme.onPrimary
                  : const Color.fromARGB(255, 68, 68, 68),
            ),
          ),
        ),
      ),
    );
  }
}
