import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

///reusable class that can be use in multiple project
///it will provide a [Dio] instance and have boilerplate code for requests
///it has a function [parseResponse] for parsing response json to a [T] object
///and [parseError] for returning a [T] object when system throwing an error
///[T] generic type is for result that parsed from json
class DioProvider<T> {
  //Constant....................................................................
  static const String GET_METHOD = "GET";
  static const String POST_METHOD = "POST";
  static const String PUT_METHOD = "PUT";
  static const String DELETE_METHOD = "DELETE";
  static const String PATCH_METHOD = "PATCH";

  DioProvider(
    this._baseUrl,
    this.parseResponse,
    this.parseError, {
    BaseOptions? baseOptions,
    bool logger = true,
  })  : assert(_baseUrl != null) {
    baseOptions?.baseUrl = _baseUrl ?? baseOptions.baseUrl;
    _dioInstance = Dio(
      baseOptions,
    );

    if (logger) {
      _dioInstance?.interceptors.add(LoggingInterceptor(
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        requestHeader: true,
        request: true,
        error: true,
      ));
    }
  }

  //Properties..................................................................
  final String? _baseUrl;
  final T Function(dynamic responseBody) parseResponse;
  final T Function(Object? e, String? errorMessage, int? statusCode) parseError;

  final _defaultCancelToken = CancelToken();

  Dio? _dioInstance;

  //Get and Set.................................................................
  Dio? get dioInstance => _dioInstance;

  String? get baseUrl => _baseUrl;

  CancelToken get defaultCancelToken => defaultCancelToken;

  //Methods.....................................................................

  void lock() {
    
  }

  void unlock() {
    
  }

  void cancelRequestWithToken(CancelToken token, String message) {
    _cancelToken(token, message);
  }

  void cancelDefaultToken(String message) {
    _cancelToken(_defaultCancelToken, message);
  }

  void _cancelToken(CancelToken token, String message) {
    token.cancel(message);
  }

  void addInterceptor(Interceptor? interceptor) {
    if (interceptor != null) {
      _dioInstance?.interceptors.add(interceptor);
    }
  }

  bool? removeInterceptor(Interceptor? interceptor) {
    if (interceptor != null) {
      return _dioInstance?.interceptors.remove(interceptor);
    }
    return false;
  }

  //Api Base method.............................................................
  Future<T> requestApi(
    String path,
    String method, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response? response = await _dioInstance?.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? _defaultCancelToken,
        options: options == null ? Options(method: method) : options
          ..method = method,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final result = parseResponse(response?.data);

      return result;
    } on DioError catch (error) {
      // The request was made and the server responded with a status code

      return parseError(
        error,
        error.response?.data["message"],
        error.response?.statusCode,
      );
    } on Exception catch (error) {
      return parseError(
        error,
        error.toString(),
        255,
      );
    } catch (error) {
      return parseError(
        error,
        error.toString(),
        255,
      );
    }
  }
}
