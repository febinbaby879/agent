import 'application.dart';
import 'filters.dart';
import 'pagination.dart';
import 'summary.dart';

class ApplicationData {
  List<ApplicationModel>? applications;
  Pagination? pagination;
  Summary? summary;
  Filters? filters;

  ApplicationData(
      {this.applications, this.pagination, this.summary, this.filters});

  factory ApplicationData.fromJson(Map<String, dynamic> json) =>
      ApplicationData(
        applications: (json['applications'] as List<dynamic>?)
            ?.map((e) => ApplicationModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
        summary: json['summary'] == null
            ? null
            : Summary.fromJson(json['summary'] as Map<String, dynamic>),
        filters: json['filters'] == null
            ? null
            : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'applications': applications?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
        'summary': summary?.toJson(),
        'filters': filters?.toJson(),
      };
}
