import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel(this.id, this.titleType, this.releaseDate, this.releaseYear,
      this.primaryImage, this.originalTitleText, this.titleText);
  final int? id;
  final String? primaryImage;
  final String? titleType;
  final String? titleText;
  final DateTime? releaseDate;
  final DateTime? releaseYear;
  final String? originalTitleText;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
