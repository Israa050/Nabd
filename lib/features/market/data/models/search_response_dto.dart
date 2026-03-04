

import 'package:json_annotation/json_annotation.dart';
import 'package:crypto_demo/features/market/data/models/searched_coin_dto.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDto {
  final List<SearchedCoinDto> coins;

  SearchResponseDto({required this.coins});

   factory SearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoFromJson(json);

}