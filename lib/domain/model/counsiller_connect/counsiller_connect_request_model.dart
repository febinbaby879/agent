
class CounsillerConnectRequestModel {
  final String? id;
  final String? type;
  final String? description;
  final DateTime? requestedDate;
  final String? status; // "Requested", "In Progress", "Completed", "Cancelled"

  CounsillerConnectRequestModel({
    this.id,
    this.type,
    this.description,
    this.requestedDate,
    this.status,
  });
  factory CounsillerConnectRequestModel.fromJson(Map<String, dynamic> json) {
    return CounsillerConnectRequestModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      requestedDate: json['requestedDate'] != null
          ? DateTime.parse(json['requestedDate'] as String)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'requestedDate': requestedDate?.toIso8601String(),
      'status': status,
    };
  }
}
