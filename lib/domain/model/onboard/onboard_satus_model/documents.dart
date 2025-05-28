import 'package:json_annotation/json_annotation.dart';

part 'documents.g.dart';

@JsonSerializable()
class Documents {
  bool? agreementSigned;
  bool? onboardingComplete;

  Documents({this.agreementSigned, this.onboardingComplete});

  factory Documents.fromJson(Map<String, dynamic> json) {
    return _$DocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);

  Documents copyWith({
    bool? agreementSigned,
    bool? onboardingComplete,
  }) {
    return Documents(
      agreementSigned: agreementSigned ?? this.agreementSigned,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    );
  }
}
