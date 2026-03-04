
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';

class TopGainersWidget extends StatelessWidget {
  const TopGainersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.topGainers,
          style: context.typography.displayTitle.copyWith(
            letterSpacing: 0.5,
            height: 1.12,
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          ),
          ),
        SizedBox(height: 10,),
      ],
    );
  }
}
