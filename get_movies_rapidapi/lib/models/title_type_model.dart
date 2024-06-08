import 'package:json_annotation/json_annotation.dart';

part 'title_type_model.g.dart';

@JsonSerializable()
class TitleTypeModel {
  TitleTypeModel(
    this.id,
    this.text,
  );
  final String? id;
  final String? text;

  factory TitleTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TitleTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TitleTypeModelToJson(this);
}
