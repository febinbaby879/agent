class Documents {
  String? passportSizePhoto;
  String? highQualiFile;
  String? masterCertification;
  String? bachelorCertification;
  String? plustwoCertification;
  String? tenthCertification;
  String? cv;

  Documents({
    this.passportSizePhoto,
    this.highQualiFile,
    this.masterCertification,
    this.bachelorCertification,
    this.plustwoCertification,
    this.tenthCertification,
    this.cv,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        passportSizePhoto: json['passportSizePhoto'] as String?,
        highQualiFile: json['highQualiFile'] as String?,
        masterCertification: json['masterCertification'] as String?,
        bachelorCertification: json['bachelorCertification'] as String?,
        plustwoCertification: json['plustwoCertification'] as String?,
        tenthCertification: json['tenthCertification'] as String?,
        cv: json['cv'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'passportSizePhoto': passportSizePhoto,
        'highQualiFile': highQualiFile,
        'masterCertification': masterCertification,
        'bachelorCertification': bachelorCertification,
        'plustwoCertification': plustwoCertification,
        'tenthCertification': tenthCertification,
        'cv': cv,
      };
}
