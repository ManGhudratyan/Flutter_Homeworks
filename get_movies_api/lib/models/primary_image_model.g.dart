part of 'primary_image_model.dart';

PrimaryImageModel _$PrimaryImageModelFromJson(Map<String, dynamic> json) =>
    PrimaryImageModel(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PrimaryImageModelToJson(PrimaryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
