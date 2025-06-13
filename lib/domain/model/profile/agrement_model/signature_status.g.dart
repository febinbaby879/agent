// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignatureStatus _$SignatureStatusFromJson(Map<String, dynamic> json) =>
    SignatureStatus(
      isAvailable: json['isAvailable'] as bool?,
      signaturePath: json['signaturePath'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignatureStatusToJson(SignatureStatus instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'signaturePath': instance.signaturePath,
      'message': instance.message,
    };
