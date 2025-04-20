import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'notification.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  Address? address;
  String? fullName;
  String? email;
  List<Notification>? notification;
  String? status;
  String? phone;
  @JsonKey(name: 'user_img')
  String? userImage;

  User(
      {this.address,
      this.fullName,
      this.email,
      this.notification,
      this.status,
      this.phone,
      this.userImage});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
