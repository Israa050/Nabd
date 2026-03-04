// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCoinDto _$MarketCoinDtoFromJson(Map<String, dynamic> json) =>
    MarketCoinDto(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: json['current_price'] as num?,
      marketCapRank: json['market_cap_rank'] as num?,
      marketCapChange24hPercent:
          json['market_cap_change_percentage_24h'] as num?,
    );

Map<String, dynamic> _$MarketCoinDtoToJson(MarketCoinDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap_rank': instance.marketCapRank,
      'market_cap_change_percentage_24h': instance.marketCapChange24hPercent,
    };
