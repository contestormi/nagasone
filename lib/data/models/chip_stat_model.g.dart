// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chip_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChipStatModel _$ChipStatModelFromJson(Map<String, dynamic> json) =>
    ChipStatModel(
      cashChipCount: json['cash_chip_count'] as int,
      cashlessChipCount: json['cashless_chip_count'] as int,
      cashSum: json['cash_sum'] as int,
      cashlessSum: json['cashless_sum'] as int,
    );

Map<String, dynamic> _$ChipStatModelToJson(ChipStatModel instance) =>
    <String, dynamic>{
      'cash_chip_count': instance.cashChipCount,
      'cashless_chip_count': instance.cashlessChipCount,
      'cash_sum': instance.cashSum,
      'cashless_sum': instance.cashlessSum,
    };
