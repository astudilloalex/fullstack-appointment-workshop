class DefaultResponse {
  const DefaultResponse({
    required this.message,
    required this.status,
    this.token,
  });

  /// The message from backend.
  final String message;

  /// The status code value for example 200.
  final int status;

  /// This value is only set when login is called.
  final String? token;

  /// Factory to build a [DefaultResponse] from [json] Map.
  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      message: json['message'] as String,
      status: json['status'] as int,
      token: json['token'] as String?,
    );
  }
}
