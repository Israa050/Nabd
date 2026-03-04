import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.text,
    this.child,
    required this.onTap,
    this.height = 50,
    this.width,
    this.borderRadius = 31,
    this.backgroundColor,
    this.textStyle,
    this.splashColor,
    this.boxBorder,
  }) : assert(
         text != null || child != null,
         'Either text or child must be provided',
       );

  final String? text;
  final Widget? child;
  final Future<void> Function() onTap;
  final double height;
  final double? width;
  final double borderRadius;

  final Color? backgroundColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  final BoxBorder? boxBorder;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius);

    return Material(
      color: widget.backgroundColor ?? Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        splashColor: widget.splashColor ?? Colors.white.withValues(alpha: 0.2),
        onTap: () async {
          if (isClicked) return;

          setState(() {
            isClicked = true;
          });

          try {
            await widget.onTap();
          } finally {
            if (mounted) {
              setState(() {
                isClicked = false;
              });
            }
          }
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: radius,
            border: widget.boxBorder,
          ),
          alignment: Alignment.center,
          child:
              widget.child ??
              Text(
                isClicked ? 'Loading...' : widget.text!,
                style:
                    widget.textStyle ??
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
