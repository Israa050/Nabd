import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class CoinDescriptionWidget extends StatefulWidget {
  const CoinDescriptionWidget({
    super.key,
    required this.coinDescription,
  });

  final CoinDescription coinDescription;

  @override
  State<CoinDescriptionWidget> createState() =>
      _CoinDescriptionWidgetState();
}

class _CoinDescriptionWidgetState extends State<CoinDescriptionWidget> {
  static const int _maxLines = 5;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.coinDescription.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About ${widget.coinDescription.name}',
          style: context.typography.headLineMedium.copyWith(
            height: 24 / 18,
          ),
          //  const TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w600,
          //   height: 24 / 18,
          //   color: Color(0xff1E1F4B),
          // ),
        ),
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: description,
              style: context.typography.bodyMedium.copyWith(
                height: 24 / 16,
              ),
              //  const TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w400,
              //   height: 24 / 16,
              //   color: Color(0xff5D5C5D),
              // ),
            );

            final textPainter = TextPainter(
              text: textSpan,
              maxLines: _maxLines,
              textDirection: TextDirection.ltr,
            )..layout(maxWidth: constraints.maxWidth);

            final exceedsMaxLines = textPainter.didExceedMaxLines;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  maxLines: _isExpanded ? null : _maxLines,
                  overflow:
                      _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 24 / 16,
                    color: Color(0xff5D5C5D),
                  ),
                ),
                if (exceedsMaxLines) ...[
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() => _isExpanded = !_isExpanded);
                    },
                    child: Text(
                      _isExpanded ? 'Read less' : 'Read more',
                      style: context.typography.bodyMedium.copyWith(
                        color: context.appColors.selectedLabelColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      // const TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w600,
                      //   color: Color(0xff4766F9),
                      // ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class CoinDescription {
  final String name;
  final String description;

  const CoinDescription({
    required this.name,
    required this.description,
  });
}