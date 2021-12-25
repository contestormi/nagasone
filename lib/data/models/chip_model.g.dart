// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChipModel _$ChipModelFromJson(Map<String, dynamic> json) => ChipModel(
      chipCount: json['chipCount'] as int,
      amount: json['amount'] as int,
      datetime: json['datetime'] as String,
      transactionType: json['transactionType'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$ChipModelToJson(ChipModel instance) => <String, dynamic>{
      'amount': instance.amount,
      'chipCount': instance.chipCount,
      'datetime': instance.datetime,
      'transactionType': instance.transactionType,
      'uuid': instance.uuid,
    };
