
class MarketChartResponseDto{
  final List<ChartPoint> chartData;

  MarketChartResponseDto({required this.chartData});

    factory MarketChartResponseDto.fromJson(Map<String, dynamic> json) {
    return MarketChartResponseDto(
      chartData: _mapToPoints(json['prices']),
    );
  }

  static List<ChartPoint> _mapToPoints(List<dynamic> rawList) {
    return rawList
        .map((e) => ChartPoint.fromList(e as List<dynamic>))
        .toList();
  }

}

class ChartPoint {
  final DateTime time;
  final double value;

  const ChartPoint({
    required this.time,
    required this.value,
  });

  factory ChartPoint.fromList(List<dynamic> data) {
    return ChartPoint(
      time: DateTime.fromMillisecondsSinceEpoch(data[0] as int),
      value: (data[1] as num).toDouble(),
    );
  }
}