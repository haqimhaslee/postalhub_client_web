import 'package:flutter/material.dart';
import 'dart:math';

class GradientBackground extends StatefulWidget {
  const GradientBackground({super.key});

  @override
  State<GradientBackground> createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: false); // Continuous back-and-forth animation

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color1 = Theme.of(context).colorScheme.primaryContainer;
    final color2 = Theme.of(context).colorScheme.secondaryContainer;
    final color3 = Theme.of(context).colorScheme.tertiaryContainer;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(_animation.value * 2 * pi),
              colors: [
                color1,
                color2,
                color3,
              ],
            ),
          ),
        );
      },
    );
  }
}
