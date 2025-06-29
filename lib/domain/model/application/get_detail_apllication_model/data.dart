import 'package:agent_dashboard/domain/model/application/get_detail_apllication_model/permenant.dart';
import 'addresses.dart';
import 'documents.dart';
import 'parent_details.dart';
import 'passport_info.dart';
import 'project_info.dart';
import 'referral_info.dart';
import 'status_info.dart';
import 'student_info.dart';
import 'timestamps.dart';
import 'work_experience.dart';

class GetDetailApplicationData {
  String? applicationId;
  Permanent? permanent;
  StudentInfo? studentInfo;
  ProjectInfo? projectInfo;
  Addresses? addresses;
  PassportInfo? passportInfo;
  ParentDetails? parentDetails;
  List<WorkExperience>? workExperience;
  Documents? documents;
  ReferralInfo? referralInfo;
  StatusInfo? statusInfo;
  dynamic intakeForm;
  Timestamps? timestamps;

  GetDetailApplicationData(
      {this.applicationId,
      this.studentInfo,
      this.projectInfo,
      this.addresses,
      this.passportInfo,
      this.parentDetails,
      this.workExperience,
      this.documents,
      this.referralInfo,
      this.statusInfo,
      this.intakeForm,
      this.timestamps,
      this.permanent});

  factory GetDetailApplicationData.fromJson(Map<String, dynamic> json) =>
      GetDetailApplicationData(
        applicationId: json['applicationId'] as String?,
        studentInfo: json['studentInfo'] == null
            ? null
            : StudentInfo.fromJson(json['studentInfo'] as Map<String, dynamic>),
        projectInfo: json['projectInfo'] == null
            ? null
            : ProjectInfo.fromJson(json['projectInfo'] as Map<String, dynamic>),
        addresses: json['addresses'] == null
            ? null
            : Addresses.fromJson(json['addresses'] as Map<String, dynamic>),
        permanent: json['permanent'] == null
            ? null
            : Permanent.fromJson(json['permanent'] as Map<String, dynamic>),
        passportInfo: json['passportInfo'] == null
            ? null
            : PassportInfo.fromJson(
                json['passportInfo'] as Map<String, dynamic>),
        parentDetails: json['parentDetails'] == null
            ? null
            : ParentDetails.fromJson(
                json['parentDetails'] as Map<String, dynamic>),
        workExperience: (json['workExperience'] as List<dynamic>?)
            ?.map((e) => WorkExperience.fromJson(e as Map<String, dynamic>))
            .toList(),
        documents: json['documents'] == null
            ? null
            : Documents.fromJson(json['documents'] as Map<String, dynamic>),
        referralInfo: json['referralInfo'] == null
            ? null
            : ReferralInfo.fromJson(
                json['referralInfo'] as Map<String, dynamic>),
        statusInfo: json['statusInfo'] == null
            ? null
            : StatusInfo.fromJson(json['statusInfo'] as Map<String, dynamic>),
        intakeForm: json['intakeForm'] as dynamic,
        timestamps: json['timestamps'] == null
            ? null
            : Timestamps.fromJson(json['timestamps'] as Map<String, dynamic>),
      );

//   Map<String, dynamic> toJson() => {
//         'applicationId': applicationId,
//         'studentInfo': studentInfo?.toJson(),
//         'projectInfo': projectInfo?.toJson(),
//         'addresses': addresses?.toJson(),
//         'passportInfo': passportInfo?.toJson(),
//         'parentDetails': parentDetails?.toJson(),
//         'workExperience': workExperience?.map((e) => e.toJson()).toList(),
//         'documents': documents?.toJson(),
//         'referralInfo': referralInfo?.toJson(),
//         'statusInfo': statusInfo?.toJson(),
//         'intakeForm': intakeForm,
//         'timestamps': timestamps?.toJson(),
//       };
}
