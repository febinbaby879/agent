import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage {
  String? key;
  String? name;
  String? description;
  String? subStage;
  String? subStageName;
  String? color;

  Stage({
    this.key,
    this.name,
    this.description,
    this.subStage,
    this.subStageName,
    this.color,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);

  Stage copyWith({
    String? key,
    String? name,
    String? description,
    String? subStage,
    String? subStageName,
    String? color,
  }) {
    return Stage(
      key: key ?? this.key,
      name: name ?? this.name,
      description: description ?? this.description,
      subStage: subStage ?? this.subStage,
      subStageName: subStageName ?? this.subStageName,
      color: color ?? this.color,
    );
  }
}
