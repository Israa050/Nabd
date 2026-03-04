import 'package:flutter/material.dart';
import 'package:crypto_demo/features/market/presentation/widgets/label.dart';

class ChartLabels extends StatefulWidget {
  const ChartLabels({super.key});

  @override
  State<ChartLabels> createState() => _ChartLabelsState();
}

class _ChartLabelsState extends State<ChartLabels> {
  // List of chart options
  final List<String> options = ['1h', '1d', '1w', '1m', '1y'];
  int selectedIndex = 1; // default selected index (1d)

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            options.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Label(
                  name: options[index],
                  isSelected: selectedIndex == index,
                  borderRadius: 8,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      // Optional: trigger chart update here if needed
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}