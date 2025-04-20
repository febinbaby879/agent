import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  String? type;
  String? title;
  String? body;
  bool? status;
  @JsonKey(name: '_id')
  String? id;
  DateTime? timestamp;

  Notification({
    this.type,
    this.title,
    this.body,
    this.status,
    this.id,
    this.timestamp,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return _$NotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
