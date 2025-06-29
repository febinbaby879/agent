class WorkExperience {
  String? workExperienceLetter;
  String? id;

  WorkExperience({this.workExperienceLetter, this.id});

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      workExperienceLetter: json['workExperienceLetter'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'workExperienceLetter': workExperienceLetter,
        '_id': id,
      };
}
