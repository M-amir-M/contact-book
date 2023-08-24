import 'dart:convert';

import 'package:contact_book/core/data/models/error.dart';


/// this class is used to parse json data that received from api call
class Result {
  final bool success;
  final List<AppError> errors;
  final dynamic data;
  final dynamic meta;
  final int? statusCode;
  final String? message;

  Result({
    this.success = true,
    this.errors = const [],
    this.data,
    this.meta,
    this.statusCode,
    this.message,
  });

  Result copyWith({
    bool? success,
    List<AppError>? errors,
    dynamic data,
    dynamic meta,
    int? statusCode,
    String? message,
  }) =>
      Result(
        success: success ?? this.success,
        errors: errors ?? this.errors,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  bool get hasError => errors.isNotEmpty;

  AppError parseAllErrors({ErrorType type = ErrorType.message}) {
    if (hasError) {
      StringBuffer buffer = StringBuffer();
      errors.forEach((element) {
        buffer.writeln(element.message);
      });
      return errors.first.copyWith(
        message: buffer.toString().replaceAll('\n', ' '),
        type: type,
      );
    }
    return AppError(
      message: message ?? 'خطای رخ داد !',
      type: type,
      // statusCode: statusCode,
      messageType: MessageType.unknown,
    );
  }

  bool get hasData => data != null;

  bool get dataIsList => hasData && data is List;

  bool get dataIsMap => hasData && data is Map;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"] == null ? true : json["success"],
        statusCode: json["code"] == null ? null : json["code"],
        errors: json["errors"] == null
            ? []
            : List<AppError>.from(
                json["errors"].map((x) => AppError.fromJson(x))),
        data: json["data"] == null ? null : json["data"],
        meta: json["meta"] == null ? null : json["meta"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
        "data": data == null ? null : data,
        "meta": meta == null ? null : meta,
        "code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
      };
}

/// responsible for parsing json to [Result] object
class ResultParser {
  ResultParser._();

  static Result parseResult(data) {
    try {
      if (data is String) {
        final jsonData = jsonDecode(data);
        return Result.fromJson(jsonData);
      } else {
        return Result.fromJson({"data":data});
      }
    } catch (error, stack) {
      return Result(success: false, errors: [
        AppError(
          message: 'Something is wrong please try again.',
          type: ErrorType.retry,
          messageType: MessageType.unknown,
          stack: stack,
        )
      ]);
    }
  }

  /// parse error is a method that invoke when a request has a error
  /// in this project we use it to return a [Result] object with an error
  /// and it will used for as a parameter for [DioProvider] constructor
  static Result parseError(Object? e, String? message, int? statusCode,
      {ErrorType? type = ErrorType.message}) {
    return Result(
      success: false,
      statusCode: statusCode,
      errors: [
        AppError(
          message: message ?? 'خطای رخ داد !',
          type: type,
          // messageType: AppError.parseMessageType(exception: e),
          // statusCode: statusCode,
        ),
      ],
    );
  }
}
