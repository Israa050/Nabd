
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected ? Color(0xff1D3A70) : Color(0xff979797),
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 12),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 250),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.12,
              height: 1.0,
              color: isSelected ? Color(0xff1D3A70) : Color(0xff979797),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
