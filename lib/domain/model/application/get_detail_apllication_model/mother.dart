class Mother {
  String? name;
  String? emailId;
  String? passportNumber;
  String? emiratesIdNumber;
  String? mobileNumber;

  Mother({
    this.name,
    this.emailId,
    this.passportNumber,
    this.emiratesIdNumber,
    this.mobileNumber,
  });

  factory Mother.fromJson(Map<String, dynamic> json) => Mother(
        name: json['name'] as String?,
        emailId: json['emailId'] as String?,
        passportNumber: json['passportNumber'] as String?,
        emiratesIdNumber: json['emiratesIdNumber'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'emailId': emailId,
        'passportNumber': passportNumber,
        'emiratesIdNumber': emiratesIdNumber,
        'mobileNumber': mobileNumber,
      };
}
