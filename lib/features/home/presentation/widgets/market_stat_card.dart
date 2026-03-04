import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketStatCard extends StatelessWidget {
  final MarketStat data;

  const MarketStatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: 169,
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.fromLTRB(22, 8, 42, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data.title,
            style: context.typography.titleSmall,
            // const TextStyle(
            //   fontSize: 14,
            //   fontWeight: FontWeight.w500,
            //   color: Color(0xff1E1F4B),
            //   height: 1.42,
            // ),
          ),

          Text(
            data.value,
            maxLines: 1,
            style: context.typography.headlineLarge,
            //  const TextStyle(
            //   fontSize: 20,
            //   fontWeight: FontWeight.w500,
            //   color: Color(0xff1E1F4B),
            //   height: 1,
            // ),
          ),

          if (data.showChange && data.change != null && data.iconPath != null)
            Row(
              children: [
                Text(
                  data.change!,
                  style: context.typography.bodyMedium.copyWith(color: context.appColors.marketChangeTextColor),
                  //  const TextStyle(
                  //   fontSize: 12,
                  //   fontWeight: FontWeight.w400,
                  //   color: Color(0xff4766F9),
                  //   height: 1.3,
                  // ),
                  textAlign: TextAlign.end,
                ),
                SvgPicture.asset(
                  data.iconPath!,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff4766F9),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class MarketStat {
  final String title;
  final String value;
  final String? change;
  final String? iconPath;
  final bool showChange;
  final Color backgroundColor;

  const MarketStat({
    required this.title,
    required this.value,
    this.change,
    this.iconPath,
    this.showChange = true,
    this.backgroundColor = Colors.white,
  });
}
