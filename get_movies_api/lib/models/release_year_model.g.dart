// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_year_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseYearModel _$ReleaseYearModelFromJson(Map<String, dynamic> json) =>
    ReleaseYearModel(
      year:
          json['year'] == null ? null : DateTime.parse(json['year'] as String),
      endYear: json['endYear'] == null
          ? null
          : DateTime.parse(json['endYear'] as String),
    );

Map<String, dynamic> _$ReleaseYearModelToJson(ReleaseYearModel instance) =>
    <String, dynamic>{
      'year': instance.year?.toIso8601String(),
      'endYear': instance.endYear?.toIso8601String(),
    };
