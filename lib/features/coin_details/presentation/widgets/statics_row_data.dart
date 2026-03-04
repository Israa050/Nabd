import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class StaticsRowData extends StatelessWidget {
  const StaticsRowData({super.key,required this.title,required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16,),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: context.typography.bodySmall.copyWith(
                  height: 16 / 12,
                  color: context.appColors.selectedLabelColor,
                ),
                // TextStyle(
                //   fontSize: 12,
                //   fontWeight: FontWeight.w400,
                //   height: 16 / 12,
                //   letterSpacing: 0.0,
                //   color: Color(0xff1E1F4B),
                // ),
              ),
          
              SizedBox(width: 15),
          
              Icon(Icons.info, size: 12, color: Color(0xff4766F9)),
          
              Expanded(child: SizedBox(width: 20)),
          
              Text(
               price,
                style: context.typography.bodyMedium.copyWith(
                  height: 20 / 14,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                //  TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w500,
                //   height: 20 / 14,
                //   color: Color(0xff1E1F4B).withValues(alpha: 0.8),
                //   letterSpacing: 0.0,
                // ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
      
          SizedBox(height: 12,),
      
          Divider(
            color: Color(0xffE2E3E4),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
