import 'package:json_annotation/json_annotation.dart';

part 'signature_status.g.dart';

@JsonSerializable()
class SignatureStatus {
  final bool? isAvailable;
  final String? signaturePath;
  final String? message;

  SignatureStatus({this.isAvailable, this.signaturePath, this.message});

  factory SignatureStatus.fromJson(Map<String, dynamic> json) =>
      _$SignatureStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureStatusToJson(this);
}
