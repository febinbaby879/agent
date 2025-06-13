class ApiResponse {
  final dynamic data;
  final bool? success;
  final String? message;
  final String? action;

  ApiResponse({
    this.data,
    this.success,
    this.message,
    this.action,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json.containsKey('data') ? json['data'] : json,
      success: (json['success'] as bool?) ?? (json['isSuccess'] as bool?),
      message: json['message'] as String?,
      action: json['action'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'success': success,
      'message': message,
      'action': action,
    };
  }

  factory ApiResponse.error([Map<String, dynamic>? json, int? statusCode]) {
    return ApiResponse(
      data: json?['data'] != null ? json!['data'] : json,
      success: false,
      action: json?['action'],
      message: (json?['message'] as String?) ?? 'Something went wrong',
    );
  }
}
