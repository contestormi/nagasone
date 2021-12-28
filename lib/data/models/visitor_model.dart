import 'package:json_annotation/json_annotation.dart';

part 'visitor_model.g.dart';

@JsonSerializable()
class VisitorModel {
  final String fio;
  final bool isPassed;
  final int id;

  VisitorModel({
    required this.fio,
    required this.isPassed,
    required this.id,
  });

  factory VisitorModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorModelToJson(this);

  VisitorModel copyWith(
    String fio,
    bool isPassed,
  ) {
    return VisitorModel(fio: fio, isPassed: isPassed, id: id);
  }
}
