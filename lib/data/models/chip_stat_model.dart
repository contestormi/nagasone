import 'package:json_annotation/json_annotation.dart';

part 'chip_stat_model.g.dart';

@JsonSerializable()
class ChipStatModel {
  @JsonKey(name: 'cash_chip_count')
  final int cashChipCount;
  @JsonKey(name: 'cashless_chip_count')
  final int cashlessChipCount;
  @JsonKey(name: 'cash_sum')
  final int cashSum;
  @JsonKey(name: 'cashless_sum')
  final int cashlessSum;

  ChipStatModel({
    required this.cashChipCount,
    required this.cashlessChipCount,
    required this.cashSum,
    required this.cashlessSum,
  });

  factory ChipStatModel.fromJson(Map<String, dynamic> json) =>
      _$ChipStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChipStatModelToJson(this);
}
