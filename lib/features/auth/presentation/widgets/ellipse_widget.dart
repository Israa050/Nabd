import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class EllipseWidget extends StatelessWidget {
  const EllipseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.topRight,
          child: SvgPicture.asset(
            'assets/svgs/ellipse_top_right.svg',
            colorFilter: ColorFilter.mode(
              context.appColors.authEllipseColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
