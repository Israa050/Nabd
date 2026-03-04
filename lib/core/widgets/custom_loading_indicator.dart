import 'package:flutter/material.dart';

class LoadingMoreIndicator extends StatefulWidget {
  const LoadingMoreIndicator({super.key});

  @override
  State<LoadingMoreIndicator> createState() => _LoadingMoreIndicatorState();
}

class _LoadingMoreIndicatorState extends State<LoadingMoreIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = (_controller.value + index * 0.2) % 1.0;
                final scale = 0.6 + (value < 0.5 ? value : 1 - value) * 0.8;
                final opacity = 0.4 + (value < 0.5 ? value : 1 - value) * 0.6;

                return Opacity(
                  opacity: opacity,
                  child: Transform.scale(scale: scale, child: child),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xff1D3A70),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
