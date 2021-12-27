// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fc_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCStatModel _$FCStatModelFromJson(Map<String, dynamic> json) => FCStatModel(
      cashFcSum: json['cash_fc_sum'] as int,
      cashlessFcSum: json['cashless_fc_sum'] as int,
    );

Map<String, dynamic> _$FCStatModelToJson(FCStatModel instance) =>
    <String, dynamic>{
      'cash_fc_sum': instance.cashFcSum,
      'cashless_fc_sum': instance.cashlessFcSum,
    };
