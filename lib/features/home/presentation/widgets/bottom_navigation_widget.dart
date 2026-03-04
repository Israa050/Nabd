

import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/features/home/presentation/widgets/bottom_nav_item.dart';


class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomAppBarTheme.color,
      width: double.infinity,
      height: 87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            text: AppConstants.home,
            imagePath: 'assets/svgs/home.svg',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          BottomNavItem(
            text: AppConstants.market,
            imagePath: 'assets/svgs/chart.svg',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          BottomNavItem(
            text: AppConstants.profile,
            imagePath: 'assets/svgs/briefcase.svg',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          BottomNavItem(
            text: AppConstants.settings,
            imagePath: 'assets/svgs/setting.svg',
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
