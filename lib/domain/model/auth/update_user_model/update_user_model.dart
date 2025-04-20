import 'package:agent_dashboard/domain/model/image/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

@JsonSerializable()
class UpdateUserModel {
  String? phone;
  Address? address;
  @JsonKey(name: 'user_img')
  ImageModel? userImage;
  String? email;
  String? fullName;

  UpdateUserModel(
      {this.phone, this.address, this.userImage, this.email, this.fullName});
  // Factory constructor for deserializing from JSON
  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(
      phone: json['phone'] as String?,
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      userImage: json['user_img'] != null
          ? ImageModel.fromMap(json['user_img'] as Map<String, dynamic>)
          : null,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
    );
  }

  // Method for serializing to JSON
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'address': address?.toJson(),
      'user_img': userImage?.toJson(),
      'email': email,
      'full_name': fullName,
    };
  }
}
