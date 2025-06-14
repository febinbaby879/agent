// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaLink _$SocialMediaLinkFromJson(Map<String, dynamic> json) =>
    SocialMediaLink(
      platform: json['platform'] as String?,
      url: json['url'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SocialMediaLinkToJson(SocialMediaLink instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'url': instance.url,
      '_id': instance.id,
    };
