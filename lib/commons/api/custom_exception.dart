class CustomException implements Exception {
  final String? _message;
  final String? _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return '{"$_prefix": $_message}';
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "ErrorDuringCommunication");
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message, "InvalidRequest");
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "InvalidInput");
}
