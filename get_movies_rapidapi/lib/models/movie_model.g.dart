// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as String?,
      primaryImageModel: json['primaryImage'] == null
          ? null
          : PrimaryImageModel.fromJson(
              json['primaryImage'] as Map<String, dynamic>),
      originalTitleTextModel: json['originalTitleText'] == null
          ? null
          : OriginalTitleTextModel.fromJson(
              json['originalTitleText'] as Map<String, dynamic>),
      releaseDateModel: json['releaseDate'] == null
          ? null
          : ReleaseDateModel.fromJson(
              json['releaseDate'] as Map<String, dynamic>),
      releaseYearModel: json['releaseYear'] == null
          ? null
          : ReleaseYearModel.fromJson(
              json['releaseYear'] as Map<String, dynamic>),
      titleTextModel: json['titleText'] == null
          ? null
          : TitleTextModel.fromJson(json['titleText'] as Map<String, dynamic>),
      titleTypeModel: json['titleType'] == null
          ? null
          : TitleTypeModel.fromJson(json['titleType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryImage': instance.primaryImageModel,
      'originalTitleText': instance.originalTitleTextModel,
      'releaseDate': instance.releaseDateModel,
      'releaseYear': instance.releaseYearModel,
      'titleText': instance.titleTextModel,
      'titleType': instance.titleTypeModel,
    };
