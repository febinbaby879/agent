class PassportInfo {
  String? passportNumber;
  String? passportIssueDtae;
  String? passportExpiry;
  String? passportIssueCountry;

  PassportInfo({
    this.passportNumber,
    this.passportIssueDtae,
    this.passportExpiry,
    this.passportIssueCountry,
  });

  factory PassportInfo.fromJson(Map<String, dynamic> json) => PassportInfo(
        passportNumber: json['passportNumber'] as String?,
        passportIssueDtae: json['passportIssueDtae'] as String?,
        passportExpiry: json['passportExpiry'] as String?,
        passportIssueCountry: json['passportIssueCountry'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'passportNumber': passportNumber,
        'passportIssueDtae': passportIssueDtae,
        'passportExpiry': passportExpiry,
        'passportIssueCountry': passportIssueCountry,
      };
}
