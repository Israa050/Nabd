
import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          height: 6.55,
          width: 6.55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF56C2A),
          ),
        ),

        SizedBox(width: 11,),

        Text(
          '1 USD = 0.00078 ETH',
          style: TextStyle(
            fontSize: 14,
            height: 24 /14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.02,
            color: Color(0xff949494),
          ),
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}