import 'dart:io';
import 'package:dio/dio.dart';
import 'package:yash_mobility_componentdevelopment_flutter/services/logging_interceptors.dart';
import 'network_exceptions.dart';

class DioApiClient {
  final String baseUrl;
  late Dio _dio;
  final List<Interceptor>? interceptors;

  //Constructor: return instance of apiclient
  DioApiClient(
    this.baseUrl,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 3)
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json;  charset=UTF-8'};

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    //Log interceptor
    _dio.interceptors.add(LoggingInterceptors());

  }

  // Method to get the data from api resources
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(baseUrl,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const NetworkExceptions.formatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Method to post the data to api
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const NetworkExceptions.formatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Method to patch the data
  Future<dynamic> patch(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const NetworkExceptions.formatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Method to delete the data from api resources
  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const NetworkExceptions.formatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

