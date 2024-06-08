import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum Gender { female, male, other }

@JsonSerializable()
class UserModel {
  final String? userId;
  final String? email;
  final String? name;
  final DateTime? birthday;
  final Gender? gender;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.birthday,
    this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
