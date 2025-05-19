class ApiResponse {
  final dynamic data;
  final bool? success;
  final String? message;

  ApiResponse({
    this.data,
    this.success,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json.containsKey('data') ? json['data'] : json,
      success: (json['success'] as bool?) ?? (json['isSuccess'] as bool?),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'success': success,
      'message': message,
    };
  }

  factory ApiResponse.error([Map<String, dynamic>? json, int? statusCode]) {
    return ApiResponse(
      data: json?['data'] != null ? json!['data'] : null,
      success: false,
      message: (json?['message'] as String?) ?? 'Something went wrong',
    );
  }
}
