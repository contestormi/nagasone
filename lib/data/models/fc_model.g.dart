// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCModel _$FCModelFromJson(Map<String, dynamic> json) => FCModel(
      amount: json['amount'] as int,
      datetime: json['datetime'] as String,
      transactionType: json['transactionType'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$FCModelToJson(FCModel instance) => <String, dynamic>{
      'amount': instance.amount,
      'datetime': instance.datetime,
      'transactionType': instance.transactionType,
      'uuid': instance.uuid,
    };
