// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chip_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChipStatModel _$ChipStatModelFromJson(Map<String, dynamic> json) =>
    ChipStatModel(
      cashChipCount: json['cashChipCount'] as int,
      cashSum: json['cashSum'] as int,
      cashlessChipCount: json['cashlessChipCount'] as int,
      cashlessSum: json['cashlessSum'] as int,
    );

Map<String, dynamic> _$ChipStatModelToJson(ChipStatModel instance) =>
    <String, dynamic>{
      'cashChipCount': instance.cashChipCount,
      'cashSum': instance.cashSum,
      'cashlessChipCount': instance.cashlessChipCount,
      'cashlessSum': instance.cashlessSum,
    };
