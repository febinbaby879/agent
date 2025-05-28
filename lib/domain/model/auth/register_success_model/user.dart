import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? name;
  String? email;
  String? agencyName;
  String? country;
  String? agentAs;
  bool? onboarding;

  User({
    this.id,
    this.name,
    this.email,
    this.agencyName,
    this.country,
    this.agentAs,
    this.onboarding,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
