import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveHelper{

  static double rsFont(BuildContext context, double base) {
    if (ResponsiveBreakpoints.of(context).isMobile) return base;
    if (ResponsiveBreakpoints.of(context).isTablet) return base * 1.3;
    return base * 1.6; // Desktop
  }
  static EdgeInsets rsPadding(BuildContext context, EdgeInsets base) {
    if (ResponsiveBreakpoints.of(context).isMobile) return base;

    if (ResponsiveBreakpoints.of(context).isTablet) {
      return base * 1.2;
    }

    return base * 1.4; // Desktop
  }


}