import 'package:json_annotation/json_annotation.dart';

part 'chip_model.g.dart';

@JsonSerializable()
class ChipModel {
  final int amount;
  final int chipCount;
  final String datetime;
  final String transactionType;
  final String uuid;

  ChipModel({
    required this.chipCount,
    required this.amount,
    required this.datetime,
    required this.transactionType,
    required this.uuid,
  });

  factory ChipModel.fromJson(Map<String, dynamic> json) =>
      _$ChipModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChipModelToJson(this);
}
