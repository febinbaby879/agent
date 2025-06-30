import 'package:json_annotation/json_annotation.dart';

import 'bank_details.dart';
import 'social_media_link.dart';
import 'uploaded_documents.dart';

part 'agent_profile.g.dart';

@JsonSerializable()
class AgentProfile {
  String? id;
  String? agentId;
  UploadedDocuments? documents;
  String? agentName;
  String? agentPhoneNumber;
  String? agentEmailId;
  String? agentCountry;
  String? companyType;
  String? businessLicense;
  String? passportFile;
  String? profileImg;
  List<SocialMediaLink>? socialMediaLinks;
  String? designation;
  String? nameofContactPerson;
  String? fullAddress;
  @JsonKey(name: 'WebsiteLink')
  String? websiteLink;
  String? dateofBirth;
  String? directorName;
  String? directorContactNumber;
  String? businessRegNum;
  @JsonKey(name: 'onboarding')
  bool? onboading;
  BankDetail? bankDetails;

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
    this.documents,
    this.id,
    this.bankDetails,
  });

  factory AgentProfile.fromJson(Map<String, dynamic> json) {
    return _$AgentProfileFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final data = _$AgentProfileToJson(this);
    data.removeWhere((key, value) => value == null);
    return data;
  }

  AgentProfile copyWith({
    String? id,
    String? agentId,
    UploadedDocuments? documents,
    String? agentName,
    String? agentPhoneNumber,
    String? agentEmailId,
    String? agentCountry,
    String? companyType,
    String? businessLicense,
    String? passportFile,
    String? profileImg,
    List<SocialMediaLink>? socialMediaLinks,
    String? designation,
    String? nameofContactPerson,
    String? fullAddress,
    String? websiteLink,
    String? dateofBirth,
    String? directorName,
    String? directorContactNumber,
    String? businessRegNum,
    bool? onboading,
    BankDetail? bankDetails,
  }) {
    return AgentProfile(
      id: id ?? this.id,
      agentId: agentId ?? this.agentId,
      documents: documents ?? this.documents,
      agentName: agentName ?? this.agentName,
      agentPhoneNumber: agentPhoneNumber ?? this.agentPhoneNumber,
      agentEmailId: agentEmailId ?? this.agentEmailId,
      agentCountry: agentCountry ?? this.agentCountry,
      companyType: companyType ?? this.companyType,
      businessLicense: businessLicense ?? this.businessLicense,
      passportFile: passportFile ?? this.passportFile,
      profileImg: profileImg ?? this.profileImg,
      socialMediaLinks: socialMediaLinks ?? this.socialMediaLinks,
      designation: designation ?? this.designation,
      nameofContactPerson: nameofContactPerson ?? this.nameofContactPerson,
      fullAddress: fullAddress ?? this.fullAddress,
      websiteLink: websiteLink ?? this.websiteLink,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      directorName: directorName ?? this.directorName,
      directorContactNumber:
          directorContactNumber ?? this.directorContactNumber,
      businessRegNum: businessRegNum ?? this.businessRegNum,
      onboading: onboading ?? this.onboading,
      bankDetails: bankDetails ?? this.bankDetails,
    );
  }
}
