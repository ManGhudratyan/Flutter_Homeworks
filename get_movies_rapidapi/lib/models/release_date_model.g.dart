// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseDateModel _$ReleaseDateModelFromJson(Map<String, dynamic> json) =>
    ReleaseDateModel(
      (json['day'] as num?)?.toInt(),
      (json['month'] as num?)?.toInt(),
      (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReleaseDateModelToJson(ReleaseDateModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };
