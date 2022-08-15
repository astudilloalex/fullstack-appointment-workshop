import 'dart:async';
import 'dart:io';

import 'package:appointment_project_siprok/src/data/enums/request_method.dart';
import 'package:appointment_project_siprok/src/data/local/secure_storage_local.dart';
import 'package:appointment_project_siprok/src/domain/responses/backend_response.dart';

import 'package:dio/dio.dart';

class HttpClient {
  HttpClient._();

  final String apiUrl = 'https://localhost:44345/api/v1';
  final Duration timeout = const Duration(seconds: 10);

  static HttpClient? _instance;

  /// Returns a instance of this class.
  // ignore: prefer_constructors_over_static_methods
  static HttpClient get instance {
    return _instance ??= HttpClient._();
  }

  Future<BackendResponse<T>> request<T>(
    String path,
    RequestMethod method, {
    String? contentType,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    ResponseType? responseType,
  }) async {
    final String? token = await const SecureStorageLocal().jwtToken;
    // final Map<String, String> headers = {
    //   if (token != null) HttpHeaders.authorizationHeader: token,
    //   'Content-Type': contentType ?? 'application/json',
    //   'Access-Control-Allow-Origin': '*',
    //   'Access-Control-Allow-Credentials': 'true',
    //   'Access-Control-Allow-Headers':
    //       'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
    //   'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, DELETE, HEAD'
    // };
    final Options options = Options(
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: token,
      },
      contentType: contentType ?? 'application/json',
      responseType: responseType ?? ResponseType.json,
    );
    final String urlPath = '$apiUrl$path';
    final Dio dio = Dio();
    try {
      final Response response;
      switch (method) {
        case RequestMethod.delete:
          response = await _delete(
            dio,
            urlPath,
            data: data,
            options: options,
            parameters: parameters,
          );
          break;
        case RequestMethod.get:
          response = await _get(
            dio,
            urlPath,
            options: options,
            parameters: parameters,
          );
          break;
        case RequestMethod.head:
          response = await _head(
            dio,
            urlPath,
            data: data,
            options: options,
            parameters: parameters,
          );
          break;
        case RequestMethod.patch:
          response = await _patch(
            dio,
            urlPath,
            data: data,
            options: options,
            parameters: parameters,
          );
          break;
        case RequestMethod.post:
          response = await _post(
            dio,
            urlPath,
            data: data,
            options: options,
            parameters: parameters,
          );
          break;
        case RequestMethod.put:
          response = await _put(
            dio,
            urlPath,
            data: data,
            options: options,
            parameters: parameters,
          );
          break;
      }
      return backendResponseFromJson<T>(response.data);
    } on SocketException {
      final Response response = Response(
        data: {'status': 503, 'message': 'server-or-internet-down'},
        statusCode: 503,
        requestOptions: RequestOptions(path: path),
      );
      return backendResponseFromJson<T>(response.data);
    } on TimeoutException {
      final Response response = Response(
        data: {'status': 408, 'message': 'request-timeout'},
        statusCode: 408,
        requestOptions: RequestOptions(path: path),
      );
      return backendResponseFromJson<T>(response.data);
    } on Exception catch (e) {
      final Response response = Response(
        data: {'status': 404, 'message': e.toString()},
        statusCode: 404,
        requestOptions: RequestOptions(path: path),
      );
      return backendResponseFromJson<T>(response.data);
    } finally {
      dio.close();
    }
  }

  Future<Response> _delete(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.delete(
      path,
      cancelToken: cancelToken,
      data: data,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }

  Future<Response> _get(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.get(
      path,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }

  Future<Response> _head(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.head(
      path,
      cancelToken: cancelToken,
      data: data,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }

  Future<Response> _patch(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.patch(
      path,
      cancelToken: cancelToken,
      data: data,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }

  Future<Response> _post(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.post(
      path,
      cancelToken: cancelToken,
      data: data,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }

  Future<Response> _put(
    Dio dio,
    String path, {
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    Options? options,
    Map<String, String>? parameters,
  }) {
    return dio.put(
      path,
      cancelToken: cancelToken,
      data: data,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      options: options,
      queryParameters: parameters,
    )..timeout(timeout);
  }
}
