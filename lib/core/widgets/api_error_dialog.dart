import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import '../networking/models/api_error_model.dart';

class ApiErrorDialog {
  static Future<void> show(
    BuildContext context, {
    required ApiErrorModel apiError,
    required String buttonLabel,
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _AnimatedErrorWrapper(
        child: _ErrorDialogContent(
          errorModel: apiError,
          buttonLabel: buttonLabel,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

/// Fade + Scale animation wrapper
class _AnimatedErrorWrapper extends StatelessWidget {
  final Widget child;
  const _AnimatedErrorWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    final animation = ModalRoute.of(context)!.animation!;

    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

class _ErrorDialogContent extends StatelessWidget {
  final ApiErrorModel errorModel;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const _ErrorDialogContent({
    required this.errorModel,
    required this.buttonLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 12,
      backgroundColor: appColors.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appColors.warningBackgroundColor,
              ),
              child: Icon(
                errorModel.errorIcon,
                size: 40,
                color: appColors.warningTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              errorModel.errorTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: appColors.selectedTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              errorModel.errorDetails,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: appColors.unselectedTextColor,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: appColors.buttonBackgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed?.call();
                },
                child: Text(
                  buttonLabel,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: appColors.buttonTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
