

import 'package:json_annotation/json_annotation.dart';

part 'market_coin_dto.g.dart';

@JsonSerializable()
class MarketCoinDto {
  final String id;
  final String name;
  final String image;
  @JsonKey(name: 'current_price')
  final num? currentPrice;
  @JsonKey(name: 'market_cap_rank')
  final num? marketCapRank;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final num? marketCapChange24hPercent;

  MarketCoinDto({
    required this.id,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapRank,
    required this.marketCapChange24hPercent,
  });

    factory MarketCoinDto.fromJson(Map<String, dynamic> json) =>
      _$MarketCoinDtoFromJson(json);
}

// {
//     "id": "bitcoin",
//     "symbol": "btc",
//     "name": "Bitcoin",
//     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
//     "current_price": 78374,
//     "market_cap": 1566132679310,
//     "market_cap_rank": 1,
//     "fully_diluted_valuation": 1566132679310,
//     "total_volume": 84068990123,
//     "high_24h": 83426,
//     "low_24h": 77082,
//     "price_change_24h": -5051.942752350136,
//     "price_change_percentage_24h": -6.05558,
//     "market_cap_change_24h": -101702434477.23169,
//     "market_cap_change_percentage_24h": -6.09787,
//     "circulating_supply": 19982656,
//     "total_supply": 19982656,
//     "max_supply": 21000000,
//     "ath": 126080,
//     "ath_change_percentage": -37.83756,
//     "ath_date": "2025-10-06T18:57:42.558Z",
//     "atl": 67.81,
//     "atl_change_percentage": 115481.02112,
//     "atl_date": "2013-07-06T00:00:00.000Z",
//     "roi": null,
//     "last_updated": "2026-02-01T08:05:33.361Z"
//   },
