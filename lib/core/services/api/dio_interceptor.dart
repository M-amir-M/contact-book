import 'dart:async';

import 'package:dio/dio.dart';
import 'dart:math' as math;


/// [LoggingInterceptor] created for logging in [Dio] library
/// and create log for request, response and error
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
    this.logSize = 2048,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log size per print
  final int logSize;

  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("");
    print('*** Request ***');
    printKV('uri', options.uri);
    printKV('path', options.path);

    if (request) {
      printKV('method', options.method);
      printKV('contentType', options.contentType.toString());
      printKV('responseType', options.responseType.toString());
      printKV('followRedirects', options.followRedirects);
      printKV('connectTimeout', options.connectTimeout);
      printKV('receiveTimeout', options.receiveTimeout);
      printKV('extra', options.extra);
    }
    if (requestHeader) {
      StringBuffer stringBuffer = new StringBuffer();
      options.headers.forEach((key, v) => stringBuffer.write('\n  $key:$v'));
      printKV('header', stringBuffer.toString());
      stringBuffer.clear();
    }
    if (requestBody) {
      print("data:");
      printAll(options.data);
    }
    print('***************');
    print("");
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      print("");
      print('*** DioError ***');
      print(err);

      if (err.response != null) {
        _printResponse(err.response);
      } else {
        //Handle error
      }
      print('****************');
      print("");
    }
    return handler.next(err);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print("");
    print("*** Response ***");
    _printResponse(response);
    print('***************');
    print("");
    return handler.next(response);
  }

  void _printResponse(Response? response) {
    printKV('uri', response?.realUri);
    if (responseHeader) {
      printKV('statusCode', response?.statusCode);
      printKV('statusMessage', response?.statusMessage);
      if (response?.isRedirect != null) printKV('redirect', response?.realUri);
      print("headers:");
      print(" " + response!.headers.toString().replaceAll("\n", "\n "));
    }
    if (responseBody) {
      print("Response Text:");
      printAll(response.toString());
    }
    print("");
  }

  printKV(String key, dynamic v) {
    print('$key: $v');
  }

  printAll(msg) {
    msg.toString().split("\n").forEach(_printAll);
  }

  _printAll(String msg) {
    int groups = (msg.length / logSize).ceil();
    for (int i = 0; i < groups; ++i) {
      print((i > 0 ? '<<Log follows the previous line: ' : '') +
          msg.substring(
              i * logSize, math.min<int>(i * logSize + logSize, msg.length)));
    }
  }

  String _checkError(DioException error) {
    String errorDetail = "";
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorDetail = "Check your Internet Connection! and Try again";
        break;
      case DioExceptionType.sendTimeout:
        errorDetail = "Slow Internet Connection!  Try again";
        break;
      case DioExceptionType.receiveTimeout:
        errorDetail = "Slow Internet Connection!  Try again";
        break;
      case DioExceptionType.badResponse:
        errorDetail = "The incoming Response is Invalid";
        break;
      case DioExceptionType.cancel:
        errorDetail = "Your Request Has Been Canceled";
        break;
      default:
        errorDetail = "Check your Internet Connection! and Try again";
        break;
    }
    return errorDetail;
  }
}
