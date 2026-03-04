
import 'package:crypto_demo/features/home/data/models/global_market_stats_dto.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';

class MarketOverviewMapper {
  static MarketOverview fromDto(MarketGlobalDto dto) {
    return MarketOverview(
      marketCapUsd: dto.marketCapUsd,
      volume24hUsd: dto.volume24hUsd,
      marketCapChange24hPercent: dto.marketCapChange24hPercent,
      btcDominancePercent: dto.btcDominancePercent,
      activeCoins: dto.activeCoins,
    );
  }
}