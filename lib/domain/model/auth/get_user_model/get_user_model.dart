import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'get_user_model.g.dart';

@JsonSerializable()
class GetUserModel {
  @JsonKey(name: 'data')
  User? user;

  GetUserModel({this.user});

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserModelToJson(this);
}
