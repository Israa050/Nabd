import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/features/market/cubit/market_coin_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketCoinCubit>();
    final appColors = context.appColors;

    return Padding(
      padding: EdgeInsetsGeometry.only(top: 16),
      child: TextField(
        onChanged: cubit.onSearchQueryChanged,
        style: TextStyle(color: appColors.selectedLabelColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: appColors.textFormFieldBackgroundColor,
          prefixIcon: Image.asset(
            'assets/images/search-normal.png',
            color: appColors.textFormFieldIconColor,
          ),
          suffixIcon: Image.asset(
            'assets/images/setting-5.png',
            color: appColors.textFormFieldIconColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appColors.textFormFieldBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appColors.textFormFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appColors.textFormFieldBorderColor),
          ),
          hintText: AppConstants.search,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0,
            letterSpacing: 0.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
