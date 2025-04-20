// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      notification: (json['notification'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      phone: json['phone'] as String?,
      userImage: json['user_img'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'address': instance.address,
      'fullName': instance.fullName,
      'email': instance.email,
      'notification': instance.notification,
      'status': instance.status,
      'phone': instance.phone,
      'user_img': instance.userImage,
    };
