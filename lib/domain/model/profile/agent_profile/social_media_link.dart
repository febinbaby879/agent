import 'package:json_annotation/json_annotation.dart';

part 'social_media_link.g.dart';

@JsonSerializable()
class SocialMediaLink {
  final String? platform;
  final String? url;
  @JsonKey(name: '_id')
  final String? id;

  SocialMediaLink({
    this.platform,
    this.url,
    this.id,
  });

  factory SocialMediaLink.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaLinkToJson(this);
}