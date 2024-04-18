// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      json['id'] as int?,
      json['titleType'] as String?,
      json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      json['releaseYear'] == null
          ? null
          : DateTime.parse(json['releaseYear'] as String),
      json['primaryImage'] as String?,
      json['originalTitleText'] as String?,
      json['titleText'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryImage': instance.primaryImage,
      'titleType': instance.titleType,
      'titleText': instance.titleText,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'releaseYear': instance.releaseYear?.toIso8601String(),
      'originalTitleText': instance.originalTitleText,
    };
