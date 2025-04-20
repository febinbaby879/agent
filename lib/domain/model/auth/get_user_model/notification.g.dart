// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      type: json['type'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      status: json['status'] as bool?,
      id: json['_id'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'status': instance.status,
      '_id': instance.id,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
