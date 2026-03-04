
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/market/presentation/widgets/label.dart';

class LabelsList extends StatefulWidget {
  const LabelsList({super.key});

  @override
  State<LabelsList> createState() => _LabelsListState();
}

class _LabelsListState extends State<LabelsList> {
   final List<String> _lables = const [
    'All',
    'DeFi',
    'NFT',
    'Gamming',
    'Metaverse',
  ];

  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _lables.length,
          separatorBuilder: (_, __) => const SizedBox(width: 4.5),
          itemBuilder: (context, index) {
            return Label(
              name: _lables[index],
              isSelected: index == _selectedIndex,
              onTap: () {
                setState(() {
                   _selectedIndex = index;
                });
              },
            );
          },
        ),
    );
  }
}