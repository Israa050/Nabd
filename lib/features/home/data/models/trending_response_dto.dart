
import 'package:crypto_demo/features/home/data/models/trending_coin_dto.dart';

class TrendingResponseDto {
  final List<TrendingCoinDto> coins;

  TrendingResponseDto({required this.coins});

  factory TrendingResponseDto.fromJson(Map<String, dynamic> json) {
    final coinsJson = json['coins'] as List<dynamic>? ?? [];

    return TrendingResponseDto(
      coins: coinsJson
          .map((e) =>
              TrendingCoinDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}