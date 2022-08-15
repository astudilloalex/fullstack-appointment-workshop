import 'package:appointment_project_siprok/src/domain/entities/city.dart';
import 'package:appointment_project_siprok/src/domain/responses/default_response.dart';

BackendResponse<T> backendResponseFromJson<T>(dynamic json) {
  return BackendResponse<T>.fromJson(json as Map<String, dynamic>);
}

class BackendResponse<T> {
  const BackendResponse({
    this.data = const [],
    required this.defaultResponse,
  });

  final List<T> data;
  final DefaultResponse defaultResponse;

  factory BackendResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'] == null
        ? []
        : json['data'] is Map<String, dynamic>
            ? <dynamic>[...json['data']]
            : json['data'] as List<dynamic>;
    return BackendResponse(
      data: data.contains(null)
          ? <T>[]
          : List<T>.from(
              data.map((json) => _checkType(json as Map<String, dynamic>)),
            ),
      defaultResponse: DefaultResponse.fromJson(json),
    );
  }
}

T _checkType<T>(Map<String, dynamic> json) {
  switch (T) {
    case City:
      return City.fromJson(json) as T;
    default:
      return City.fromJson(json) as T;
  }
}
