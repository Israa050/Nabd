import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/coin_list_tile_base.dart';

class ExchangeRow extends StatelessWidget {
  const ExchangeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CoinListTileBase(
      leading: Image.asset('assets/images/row_icon.png'),
      titleSection: _TitleColumn(),
      trailing: Text(
        '\$26',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.0,
          letterSpacing: 0.0,
          color: Color(0xff1D3A70),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _TitleColumn extends StatelessWidget {
  const _TitleColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exchange fee',
          style: TextStyle(
            fontSize: 12,
            height: 24 / 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff949494),
            letterSpacing: 0.02,
          ),
          textAlign: TextAlign.center,
        ),

        Text(
          '0.05%',
          style: TextStyle(
            fontSize: 16,
            height: 26 / 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.0,
            color: Color(0xff1D3A70),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
