import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(
    this.id,
    this.email,
    this.name,
    this.phone,
    this.website,
    this.username,
  );
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
