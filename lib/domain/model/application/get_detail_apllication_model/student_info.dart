class StudentInfo {
  String? firstName;
  String? lastName;
  String? fullName;
  String? emailId;
  String? mobileNumber;
  String? dateOfBirth;
  String? civilStatus;
  String? gender;
  String? emiratesId;

  StudentInfo({
    this.firstName,
    this.lastName,
    this.fullName,
    this.emailId,
    this.mobileNumber,
    this.dateOfBirth,
    this.civilStatus,
    this.gender,
    this.emiratesId,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        fullName: json['fullName'] as String?,
        emailId: json['emailId'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        civilStatus: json['civilStatus'] as String?,
        gender: json['gender'] as String?,
        emiratesId: json['emiratesId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'emailId': emailId,
        'mobileNumber': mobileNumber,
        'dateOfBirth': dateOfBirth,
        'civilStatus': civilStatus,
        'gender': gender,
        'emiratesId': emiratesId,
      };
}
