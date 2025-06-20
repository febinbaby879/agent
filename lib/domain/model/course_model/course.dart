class Course {
  String? courseName;
  String? tuitionFeeUsd;
  int? visaFeeUsd;
  int? agentIncentiveUsd;

  Course(
      {this.courseName,
      this.tuitionFeeUsd,
      this.visaFeeUsd,
      this.agentIncentiveUsd});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
      courseName: json['courseName'] as String?,
      tuitionFeeUsd: json['tuitionFeeUSD']?.toString(),
      visaFeeUsd: json['visaFeeUSD'] as int?,
      agentIncentiveUsd: json['agentIncentiveUSD'] as int?);

  Map<String, dynamic> toJson() => {
        'courseName': courseName,
        'tuitionFeeUSD': tuitionFeeUsd,
        'visaFeeUSD': visaFeeUsd,
        'agentIncentiveUSD': agentIncentiveUsd
      };
}
