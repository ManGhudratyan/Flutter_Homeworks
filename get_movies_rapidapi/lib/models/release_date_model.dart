import 'package:json_annotation/json_annotation.dart';

part 'release_date_model.g.dart';

@JsonSerializable()
class ReleaseDateModel {
  ReleaseDateModel(
    this.day,
    this.month,
    this.year,
  );
  final int? day;
  final int? month;
  final int? year;
  factory ReleaseDateModel.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDateModelToJson(this);
}
