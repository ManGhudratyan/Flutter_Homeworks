// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryImageModel _$PrimaryImageModelFromJson(Map<String, dynamic> json) =>
    PrimaryImageModel(
      json['id'] as String?,
      (json['height'] as num?)?.toInt(),
      (json['width'] as num?)?.toInt(),
      json['url'] as String?,
    );

Map<String, dynamic> _$PrimaryImageModelToJson(PrimaryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
