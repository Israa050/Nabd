import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final bool isChildCentered;

  const DecoratedCard({
    super.key,
    required this.child,
    this.height = 160,
    this.width = 330,
    this.padding = const EdgeInsets.symmetric(horizontal: 6),
    this.isChildCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xff1D3A70),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/small_circle.png'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/big_circle.png'),
            ),

            isChildCentered ? Center(child: child) : child,
          ],
        ),
      ),
    );
  }
}
