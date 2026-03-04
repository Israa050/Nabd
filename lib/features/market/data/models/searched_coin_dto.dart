

import 'package:json_annotation/json_annotation.dart';

part 'searched_coin_dto.g.dart';

@JsonSerializable()
class SearchedCoinDto {
   final String id;
   final String name;
   final String large;
   @JsonKey(name: 'market_cap_rank')
   final num rank;

  SearchedCoinDto({required this.id, required this.name, required this.large, required this.rank,});

   factory SearchedCoinDto.fromJson(Map<String, dynamic> json) =>
      _$SearchedCoinDtoFromJson(json);
   
}

//  {
//       "id": "bitcoin",
//       "name": "Bitcoin",
//       "api_symbol": "bitcoin",
//       "symbol": "BTC",
//       "market_cap_rank": 1,
//       "thumb": "https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png",
//       "large": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png"
//     },