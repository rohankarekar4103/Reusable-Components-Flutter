import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'network_exceptions.dart';
part 'api_result.freezed.dart';

// ApiResult defines the result of API response either success or failure
@freezed
abstract class ApiResult<T> with _$ApiResult<T> {

  const factory ApiResult.success(T data) = Success<T>;

  const factory ApiResult.failure(NetworkExceptions error) = Failure<T>;

}