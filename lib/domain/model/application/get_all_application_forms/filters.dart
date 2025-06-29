class Filters {
  String? status;
  String? currentStage;
  String? search;
  String? sortBy;
  String? sortOrder;

  Filters({
    this.status,
    this.currentStage,
    this.search,
    this.sortBy,
    this.sortOrder,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        status: json['status'] as String?,
        currentStage: json['currentStage'] as String?,
        search: json['search'] as String?,
        sortBy: json['sortBy'] as String?,
        sortOrder: json['sortOrder'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'currentStage': currentStage,
        'search': search,
        'sortBy': sortBy,
        'sortOrder': sortOrder,
      };
}
