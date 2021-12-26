import 'package:json_annotation/json_annotation.dart';

part 'fc_model.g.dart';

@JsonSerializable()
class FCModel {
  final int amount;
  final String datetime;
  final String transactionType;
  final String uuid;

  FCModel({
    required this.amount,
    required this.datetime,
    required this.transactionType,
    required this.uuid,
  });

  factory FCModel.fromJson(Map<String, dynamic> json) =>
      _$FCModelFromJson(json);

  Map<String, dynamic> toJson() => _$FCModelToJson(this);
}
