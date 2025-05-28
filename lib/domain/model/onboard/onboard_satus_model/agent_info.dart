import 'package:json_annotation/json_annotation.dart';

part 'agent_info.g.dart';

@JsonSerializable()
class AgentInfo {
  String? id;
  String? name;
  String? agency;
  String? email;
  String? phone;

  AgentInfo({this.id, this.name, this.agency, this.email, this.phone});

  factory AgentInfo.fromJson(Map<String, dynamic> json) {
    return _$AgentInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentInfoToJson(this);

  AgentInfo copyWith({
    String? id,
    String? name,
    String? agency,
    String? email,
    String? phone,
  }) {
    return AgentInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      agency: agency ?? this.agency,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
