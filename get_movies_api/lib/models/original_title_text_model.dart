import 'package:json_annotation/json_annotation.dart';

part 'original_title_text_model.g.dart';

@JsonSerializable()
class OriginalTitleTextModel {
  OriginalTitleTextModel({this.text});
  final String? text;

  factory OriginalTitleTextModel.fromJson(Map<String, dynamic> json) =>
      _$OriginalTitleTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalTitleTextModelToJson(this);
}
