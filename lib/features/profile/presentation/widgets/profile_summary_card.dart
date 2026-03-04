import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/decorated_card.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedCard(
      isChildCentered: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 44,top: 16,bottom: 12,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.totalValue,
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xffF5F8FE).withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.44,
                height: 1.77, // TextStyle.height = Figma line-height (px) / fontSize (px)
              ),
            ),
            const SizedBox(height: 7),
        
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '\$143,421.20',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.44,
                  height: 1.77,
                ),
              ),
            ),
            const SizedBox(height: 6),
        
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '+2.5% (\$305.20) Today',
                    style: TextStyle(
                      color: Color(0xff69D895),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.44,
                      height: 2,
                    ),
                  ),
        
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      fontSize: 28.25,
                      letterSpacing: 0.44,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}