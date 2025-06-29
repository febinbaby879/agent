class ReferralInfo {
  String? referredByName;
  String? referredByMobileNumber;
  String? referredByEmailId;
  String? referredByCountry;

  ReferralInfo({
    this.referredByName,
    this.referredByMobileNumber,
    this.referredByEmailId,
    this.referredByCountry,
  });

  factory ReferralInfo.fromJson(Map<String, dynamic> json) => ReferralInfo(
        referredByName: json['referredByName'] as String?,
        referredByMobileNumber: json['referredByMobileNumber'] as String?,
        referredByEmailId: json['referredByEmailId'] as String?,
        referredByCountry: json['referredByCountry'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'referredByName': referredByName,
        'referredByMobileNumber': referredByMobileNumber,
        'referredByEmailId': referredByEmailId,
        'referredByCountry': referredByCountry,
      };
}
