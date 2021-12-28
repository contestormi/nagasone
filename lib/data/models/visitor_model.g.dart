// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorModel _$VisitorModelFromJson(Map<String, dynamic> json) => VisitorModel(
      fio: json['fio'] as String,
      isPassed: json['isPassed'] as bool,
      id: json['id'] as int,
    );

Map<String, dynamic> _$VisitorModelToJson(VisitorModel instance) =>
    <String, dynamic>{
      'fio': instance.fio,
      'isPassed': instance.isPassed,
      'id': instance.id,
    };
