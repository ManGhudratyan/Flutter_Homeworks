// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'birthday': instance.birthday?.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender],
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
  Gender.other: 'other',
};
