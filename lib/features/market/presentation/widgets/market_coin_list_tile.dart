import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/di/dependency_injection.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';
import 'package:crypto_demo/core/widgets/coin_list_tile_base.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/presentation/screens/coin_details_screen.dart';

class MarketCoinListTile extends StatelessWidget {
  final MarketCoinUI coin;
  const MarketCoinListTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => getIt<CoinDetailsCubit>(param1: coin.id),
              child: CoinDetailsScreen(),
            ),
          ),
        );
      },
      child: CoinListTileBase(
        leading: Hero(tag: coin.id, child: SquaredCoinIcon(iconPath: coin.imagePath, isOnlineIcon: true)),
        titleSection: _TitleSection(coin: coin),
        trailing: _TrailingSection(coin: coin),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final MarketCoinUI coin;

  const _TitleSection({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coin.name,
          maxLines: 1,
          style: context.typography.titleMedium,
          //  const TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w700,
          //   color: Color(0xff1D3A70),
          // ),
        ),
        Text(
          'Rank #${coin.rank}',
          style: context.typography.titleSmall.copyWith(color: Color(0xff949494), height: 1.7),
          //  const TextStyle(
          //   fontSize: 14,
          //   fontWeight: FontWeight.w500,
          //   color: Color(0xff949494),
          //   height: 1.7,
          // ),
        ),
      ],
    );
  }
}

class _TrailingSection extends StatelessWidget {
  final MarketCoinUI coin;

  const _TrailingSection({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          coin.price,
          style: context.typography.bodySmall, // const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        Container(
          height: 22,
          width: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: coin.isPositive ? Colors.green : Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                coin.isPositive
                    ? 'assets/images/arrow-up-right.png'
                    : 'assets/images/arrow-down-right.png',
              ),
              Center(
                child: Text(
                  coin.change,
                  style:  TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MarketCoinUI {
  final String id;
  final String name;
  final String price;
  final String change;
  final bool isPositive;
  final String imagePath;
  final String rank;

  MarketCoinUI({
    required this.id,
    required this.name,
    required this.price,
    required this.change,
    required this.isPositive,
    required this.imagePath,
    required this.rank,
  });
}
