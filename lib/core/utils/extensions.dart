

import 'package:flutter/material.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';
import '../networking/models/api_error_model.dart';
import '../widgets/api_error_dialog.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}


extension ErrorDialogExtension on BuildContext {
  Future<void> showApiErrorDialog({
    required ApiErrorModel apiError,
    String buttonLabel = "Okay",
    VoidCallback? onPressed,
  }) {
    return ApiErrorDialog.show(
      this,
      apiError: apiError,
      buttonLabel: buttonLabel,
      onPressed: onPressed,
    );
  }
}


extension AsyncStateUI<T> on AsyncState<T> {
  Widget when({
    Widget Function()? initial,
    required Widget Function() loading,
    required Widget Function(T data) success,
    required Widget Function(ApiErrorModel? error) failure,
  }) {
    switch (status) {
      case LoadStatus.initial:
      case LoadStatus.loading:
        return loading();

      case LoadStatus.success:
        return success(data as T);

      case LoadStatus.failure:
        return failure(error);
    }
  }
}


extension AsyncStateX<T> on AsyncState<T> {
  bool get isInitial => status == LoadStatus.initial;
  bool get isLoading => status == LoadStatus.loading;
  bool get isSuccess => status == LoadStatus.success;
  bool get isFailure => status == LoadStatus.failure;

  ApiErrorModel? get failure => isFailure ? error : null;
}

extension NumberFormatting on num {
  String get usd =>
      '\$${toDouble().toStringAsFixed(2)}';

   String get percent =>
      '${toDouble().toStringAsFixed(2)}%';

  String get signedPercent {
    final sign = this > 0 ? '+' : '';
    return '$sign${toDouble().toStringAsFixed(2)}%';
  }

    String get compact {
    final value = toDouble().abs();

    if (value >= 1e12) return '\$${(this / 1e12).toStringAsFixed(2)}T';
    if (value >= 1e9) return '\$${(this / 1e9).toStringAsFixed(2)}B';
    if (value >= 1e6) return '\$${(this / 1e6).toStringAsFixed(2)}M';
    if (value >= 1e3) return '\$${(this / 1e3).toStringAsFixed(2)}K';

    return '\$${toStringAsFixed(2)}';
  }

  String get price{
     final value = toDouble().abs();

    if (value >= 1e12) return '${(this / 1e12).toStringAsFixed(2)} \$';
    if (value >= 1e9) return '${(this / 1e9).toStringAsFixed(2)} \$';
    if (value >= 1e6) return '${(this / 1e6).toStringAsFixed(2)} \$';
    if (value >= 1e3) return '${(this / 1e3).toStringAsFixed(2)} \$';

    return '${toStringAsFixed(2)} \$';
  }

 
  String get formattedCurrency {
    return _format(withCurrency: true);
  }

  String get formattedNumber {
    return _format(withCurrency: false);
  }

  String _format({required bool withCurrency}) {
    final isNegative = this < 0;
    final value = abs();

    final parts = value.toStringAsFixed(_decimalDigits).split('.');
    final integerPart = _groupThousands(parts[0]);
    final decimalPart = parts.length > 1 ? ',${parts[1]}' : '';

    final buffer = StringBuffer();

    if (isNegative) buffer.write('-');
    buffer.write(integerPart);
    buffer.write(decimalPart);

    if (withCurrency) buffer.write(' \$');

    return buffer.toString();
  }

  int get _decimalDigits => this % 1 == 0 ? 0 : 2;

  String _groupThousands(String value) {
    final buffer = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      final reverseIndex = value.length - i;
      buffer.write(value[i]);

      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }
}

extension TrendingCoinUi on TrendingCoin {
  String get priceText => priceUsd.usd;

  String get change24hText => changePercent24h.signedPercent;

  bool get isPositiveChange => changePercent24h >= 0;
}


extension TopGainersUi on Coin {
  String get priceText => priceUsd.usd;

  String get change24hText => priceChange24hPercent.signedPercent;

  bool get isPositiveChange => priceChange24hPercent >= 0;
}

extension MarketOverviewUi on MarketOverview {
  String get marketCapText => marketCapUsd.compact;

  String get marketChange => marketCapChange24hPercent.signedPercent;

  String get volume24hText => volume24hUsd.compact;

  String get btcDominanceText =>
      btcDominancePercent.percent;
}