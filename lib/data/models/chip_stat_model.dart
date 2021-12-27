import 'package:json_annotation/json_annotation.dart';

part 'chip_stat_model.g.dart';

@JsonSerializable()
class ChipStatModel {
  final int cashChipCount;
  final int cashSum;
  final int cashlessChipCount;
  final int cashlessSum;

  ChipStatModel({
    required this.cashChipCount,
    required this.cashSum,
    required this.cashlessChipCount,
    required this.cashlessSum,
  });

  factory ChipStatModel.fromJson(Map<String, dynamic> json) =>
      _$ChipStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChipStatModelToJson(this);
}
