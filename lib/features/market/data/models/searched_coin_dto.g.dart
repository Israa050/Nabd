// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedCoinDto _$SearchedCoinDtoFromJson(Map<String, dynamic> json) =>
    SearchedCoinDto(
      id: json['id'] as String,
      name: json['name'] as String,
      large: json['large'] as String,
      rank: json['market_cap_rank'] as num,
    );

Map<String, dynamic> _$SearchedCoinDtoToJson(SearchedCoinDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'large': instance.large,
      'market_cap_rank': instance.rank,
    };
