import 'package:json_annotation/json_annotation.dart';

part 'agent_profile.g.dart';

@JsonSerializable()
class AgentProfile {
  String? agentId;
  String? agentName;
  String? agentPhoneNumber;
  String? agentEmailId;
  String? agentCountry;
  String? companyType;
  String? businessLicense;
  String? passportFile;
  String? profileImg;
  List<dynamic>? socialMediaLinks;
  String? designation;
  String? nameofContactPerson;
  String? fullAddress;
  String? websiteLink;
  String? dateofBirth;
  String? directorName;
  String? directorContactNumber;
  String? businessRegNum;
  bool? onboading;

  AgentProfile({
    this.agentId,
    this.agentName,
    this.agentPhoneNumber,
    this.agentEmailId,
    this.agentCountry,
    this.companyType,
    this.businessLicense,
    this.passportFile,
    this.profileImg,
    this.socialMediaLinks,
    this.designation,
    this.nameofContactPerson,
    this.fullAddress,
    this.websiteLink,
    this.dateofBirth,
    this.directorName,
    this.directorContactNumber,
    this.businessRegNum,
    this.onboading,
  });

  factory AgentProfile.fromJson(Map<String, dynamic> json) {
    return _$AgentProfileFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final data = _$AgentProfileToJson(this);
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
