import 'package:get_movies/models/primary_image_model.dart';
import 'package:get_movies/models/release_year_model.dart';
import 'package:get_movies/models/title_text_model.dart';
import 'package:json_annotation/json_annotation.dart';
part "movie_model.g.dart";

@JsonSerializable()
class MovieModel {
  MovieModel({this.titleText, this.id, this.primaryImage, this.releaseYear});
  final String? id;
  final PrimaryImageModel? primaryImage;
  final TitleTextModel? titleText;
  final ReleaseYearModel? releaseYear;
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
