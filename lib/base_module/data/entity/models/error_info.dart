import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ErrorInfo {
  final String? message;
  final int? statusCode;
  final String? type;

  ErrorInfo({
    this.message,
    this.statusCode,
    this.type,
  });

  factory ErrorInfo.fromJson({
    required OperationException? operationException,
  }) {
    String? message, type;
    int? statusCode;

    if (operationException != null) {
      final graphqlErrors = operationException.graphqlErrors;
      final linkException = operationException.linkException;

      if (graphqlErrors.isNotEmpty) {
        message = graphqlErrors.first.message;
      } else if (linkException != null) {
        if (linkException is NetworkException) {
          message = linkException.message;
        } else if (linkException is ServerException) {
          final errors = linkException.parsedResponse?.errors ?? [];

          if (errors.isNotEmpty) {
            message = errors.first.message;
          }
        } else if (linkException is RequestFormatException) {
          final errors = linkException.originalException?.toString() ?? "";

          if (errors.isNotEmpty) {
            message = errors;
          }
        }
      }
    }

    if (message?.trim() != null) {
      debugPrint("ErrorInfo.fromJson:$message");
    }

    return ErrorInfo(
      message: message ?? 'Some error occurred',
      statusCode: statusCode ?? 500,
      type: type ?? message ?? ErrorType.SOME_ERROR,
    );
  }
}

class ErrorType {
  // ignore: constant_identifier_names
  static const BAD_REQUEST = 'BAD_REQUEST';
  // ignore: constant_identifier_names
  static const UNAUTHORIZED = 'UNAUTHORIZED';
  // ignore: constant_identifier_names
  static const FORBIDDEN = 'FORBIDDEN';
  // ignore: constant_identifier_names
  static const NOT_FOUND = 'NOT_FOUND';
  // ignore: constant_identifier_names
  static const INVALID_EMAIL = 'INVALID_EMAIL';
  // ignore: constant_identifier_names
  static const INVALID_PHONE = 'INVALID_PHONE';
  // ignore: constant_identifier_names
  static const FAILED = 'FAILED';
  // ignore: constant_identifier_names
  static const SOME_ERROR = 'SOME_ERROR';
  // ignore: constant_identifier_names
  static const NO_CHANGES = 'NO_CHANGES';
  // ignore: constant_identifier_names
  static const ALREADY_EXIST = 'ALREADY_EXIST';
  // ignore: constant_identifier_names
  static const WRONG_PASSWORD = 'WRONG_PASSWORD';
  // ignore: constant_identifier_names
  static const OTP_EXPIRED = 'OTP_EXPIRED';
  // ignore: constant_identifier_names
  static const INVALID = "INVALID";
  // ignore: constant_identifier_names
  static const TIME_OUT = "TIME_OUT";
}
