import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class ReceiptRow extends StatefulWidget {
  const ReceiptRow({super.key});

  @override
  State<ReceiptRow> createState() => _ReceiptRowState();
}

class _ReceiptRowState extends State<ReceiptRow> {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.typography;

    bool isSwitched = true;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Send receipt to your email',
          style: typography.titleSmall.copyWith(
            color:
                colors.selectedLabelColor, // usually what text like this uses
          ),
        ),

        Switch.adaptive(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          dragStartBehavior: DragStartBehavior.start,
          inactiveThumbColor: Colors.white,
          activeThumbColor: Colors.white,
          activeTrackColor: const Color(0xff1D3A70),
          inactiveTrackColor: Colors.grey,
        ),
      ],
    );
  }
}
