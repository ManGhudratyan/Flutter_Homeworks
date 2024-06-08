import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  PhotoModel({this.url});
  final String? url;
  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
