

import 'package:crypto_demo/features/coin_details/data/models/chart_response_dto.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/market_chart.dart';

class MarketChartMapper {
  static MarketChart fromModel(MarketChartResponseDto marketChart){
    return MarketChart(
      chartData: marketChart.chartData,
    );
  }
}