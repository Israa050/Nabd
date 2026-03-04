// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  currentPrice: json['current_price'] as num?,
  priceChangePercentage: json['price_change_percentage_24h'] as num?,
);

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'image': instance.image,
  'current_price': instance.currentPrice,
  'price_change_percentage_24h': instance.priceChangePercentage,
};
