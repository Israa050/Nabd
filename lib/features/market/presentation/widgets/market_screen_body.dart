import 'package:flutter/material.dart';
import 'package:crypto_demo/features/market/presentation/widgets/labels_list.dart';
import 'package:crypto_demo/features/market/presentation/widgets/market_coins_list_bloc_builder.dart';
import 'package:crypto_demo/features/market/presentation/widgets/search_field.dart';

class MarketScreenBody extends StatelessWidget {
  const MarketScreenBody({super.key});

 // late final ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 17, 30),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SearchField()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: LabelsList()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
      
          MarketCoinsListBlocBuilder(),
    
        ],
      ),
    );
  }
}