import 'package:responsive_framework/responsive_framework.dart';  // ← أضف السطر ده
import 'package:flutter/material.dart';

class ResponsiveSetup {
  static Widget builder(BuildContext context, Widget? child) {
    return ResponsiveBreakpoints.builder(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
      ],
      child: child!,
    );


  }
}
