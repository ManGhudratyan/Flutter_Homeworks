import 'package:get_movies_rapidapi/models/original_title_text_model.dart';
import 'package:get_movies_rapidapi/models/primary_image_model.dart';
import 'package:get_movies_rapidapi/models/release_date_model.dart';
import 'package:get_movies_rapidapi/models/release_year_model.dart';
import 'package:get_movies_rapidapi/models/title_text_model.dart';
import 'package:get_movies_rapidapi/models/title_type_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel({
    this.id,
    this.primaryImageModel,
    this.originalTitleTextModel,
    this.releaseDateModel,
    this.releaseYearModel,
    this.titleTextModel,
    this.titleTypeModel,
  });
  final String? id;
  @JsonKey(name: "primaryImage")
  final PrimaryImageModel? primaryImageModel;
  @JsonKey(name: "originalTitleText")
  final OriginalTitleTextModel? originalTitleTextModel;
  @JsonKey(name: "releaseDate")
  final ReleaseDateModel? releaseDateModel;
  @JsonKey(name: "releaseYear")
  final ReleaseYearModel? releaseYearModel;
  @JsonKey(name: "titleText")
  final TitleTextModel? titleTextModel;
  @JsonKey(name: "titleType")
  final TitleTypeModel? titleTypeModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
