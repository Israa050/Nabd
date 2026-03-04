
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PortfolioPieChart extends StatelessWidget {
  const PortfolioPieChart({
    super.key,
    this.sections = _mockedSections,
    this.totalLabel = _mockedTotal,
  });

  final List<PieChartSectionModel> sections;
  final String totalLabel;

  static const String _mockedTotal = '\$143,421.20';

  static const List<PieChartSectionModel> _mockedSections = [
    PieChartSectionModel(
      value: 50,
      color: Color(0xffFF928A),
    ),
    PieChartSectionModel(
      value: 25,
      color: Color(0xff3CC3DF),
    ),
    PieChartSectionModel(
      value: 40,
      color: Color(0xff8979FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: PieChart(
                PieChartData(
                  sections: _buildSections(),
                  sectionsSpace: 0,
                ),
              ),
            ),
          ),
          _CenterLabel(text: totalLabel),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    return sections
        .map(
          (section) => PieChartSectionData(
            value: section.value,
            radius: 20,
            color: section.color,
            showTitle: false,
          ),
        )
        .toList();
  }
}

class _CenterLabel extends StatelessWidget {
  const _CenterLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.typography.subtitle.copyWith(
        color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
      ),
      // const TextStyle(
      //   fontSize: 15,
      //   color: Color(0xff1D3A70),
      //   fontWeight: FontWeight.w700,
      //   letterSpacing: 0.44,
      //   height: 28.25 / 15,
      textAlign: TextAlign.center,
    );
  }
}

class PieChartSectionModel {
  final double value;
  final Color color;

  const PieChartSectionModel({
    required this.value,
    required this.color,
  });
}