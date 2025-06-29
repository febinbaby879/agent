class Timestamps {
  DateTime? createdAt;
  DateTime? updatedAt;

  Timestamps({this.createdAt, this.updatedAt});

  factory Timestamps.fromJson(Map<String, dynamic> json) => Timestamps(
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
