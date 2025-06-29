import 'father.dart';
import 'mother.dart';

class ParentDetails {
  Father? father;
  Mother? mother;

  ParentDetails({this.father, this.mother});

  factory ParentDetails.fromJson(Map<String, dynamic> json) => ParentDetails(
        father: json['father'] == null
            ? null
            : Father.fromJson(json['father'] as Map<String, dynamic>),
        mother: json['mother'] == null
            ? null
            : Mother.fromJson(json['mother'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'father': father?.toJson(),
        'mother': mother?.toJson(),
      };
}
