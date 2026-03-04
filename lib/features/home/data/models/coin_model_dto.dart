

import 'package:json_annotation/json_annotation.dart';

part 'coin_model_dto.g.dart';

@JsonSerializable()
class CoinModel {
   final String id;
   final String symbol;
   final String name;
   final String image;
   @JsonKey(name: 'current_price')
   final num? currentPrice;
   @JsonKey(name: 'price_change_percentage_24h')
   final num? priceChangePercentage;

  CoinModel({required this.id, required this.symbol, required this.name, required this.image, required this.currentPrice, required this.priceChangePercentage,});

   
   factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}