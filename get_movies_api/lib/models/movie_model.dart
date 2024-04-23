import 'package:get_movies_api/models/original_title_text_model.dart';
import 'package:get_movies_api/models/primary_image_model.dart';
import 'package:get_movies_api/models/release_date_model.dart';
import 'package:get_movies_api/models/release_year_model.dart';
import 'package:get_movies_api/models/title_text_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel({
    this.id,
    this.primaryImage,
    this.originalTitleText,
    this.releaseDate,
    this.releaseYear,
    this.titleText,
  });
  final String? id;
  final PrimaryImageModel? primaryImage;
  final OriginalTitleTextModel? originalTitleText;
  final ReleaseDateModel? releaseDate;
  final ReleaseYearModel? releaseYear;
  final TitleTextModel? titleText;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
