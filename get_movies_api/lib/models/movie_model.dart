import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel({this.id, this.primaryImage, this.titleType, this.titleText}); 
  final String? id;
  final String? primaryImage;
  final String? titleType;
  final String? titleText;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
