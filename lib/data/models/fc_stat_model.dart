import 'package:json_annotation/json_annotation.dart';

part 'fc_stat_model.g.dart';

@JsonSerializable()
class FCStatModel {
  @JsonKey(name: 'cash_fc_sum')
  final int cashFcSum;
  @JsonKey(name: 'cashless_fc_sum')
  final int cashlessFcSum;

  FCStatModel({
    required this.cashFcSum,
    required this.cashlessFcSum,
  });

  factory FCStatModel.fromJson(Map<String, dynamic> json) =>
      _$FCStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$FCStatModelToJson(this);
}
