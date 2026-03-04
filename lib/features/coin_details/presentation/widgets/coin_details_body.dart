import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_description_builder.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/header_bloc_builder.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/line_chart_bloc_builder.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/statics_bloc_builder.dart';

class CoinDetailsBody extends StatefulWidget {
  const CoinDetailsBody({super.key});

  @override
  State<CoinDetailsBody> createState() => _CoinDetailsBodyState();
}

class _CoinDetailsBodyState extends State<CoinDetailsBody> {

  @override
  void initState() {
    super.initState();
    context.read<CoinDetailsCubit>().loadCoinDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 17, 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderBlocBuilder()),

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(child: LineChartBlocBuilder()),

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(child: StaticsBlocBuilder()),

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(child: CoinDescriptionBuilder()),
        ],
      ),
    );
  }
}