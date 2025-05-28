import 'package:json_annotation/json_annotation.dart';

part 'next_step.g.dart';

@JsonSerializable()
class NextStep {
  String? title;
  String? message;
  String? type;

  NextStep({this.title, this.message, this.type});

  factory NextStep.fromJson(Map<String, dynamic> json) {
    return _$NextStepFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NextStepToJson(this);

  NextStep copyWith({
    String? title,
    String? message,
    String? type,
  }) {
    return NextStep(
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}
