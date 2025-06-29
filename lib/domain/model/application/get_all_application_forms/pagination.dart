class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalApplications;
  int? limit;
  bool? hasNextPage;
  bool? hasPrevPage;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalApplications,
    this.limit,
    this.hasNextPage,
    this.hasPrevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['currentPage'] as int?,
        totalPages: json['totalPages'] as int?,
        totalApplications: json['totalApplications'] as int?,
        limit: json['limit'] as int?,
        hasNextPage: json['hasNextPage'] as bool?,
        hasPrevPage: json['hasPrevPage'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'totalPages': totalPages,
        'totalApplications': totalApplications,
        'limit': limit,
        'hasNextPage': hasNextPage,
        'hasPrevPage': hasPrevPage,
      };
}
