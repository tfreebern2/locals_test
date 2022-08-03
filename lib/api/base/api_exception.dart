class ApiException implements Exception {
  final String? message;
  final String? prefix;

  ApiException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([message]) : super(message, "");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "");
}

class NotFoundException extends ApiException {
  NotFoundException([message]) : super(message, "");
}

class ConflictException extends ApiException {
  ConflictException([message]) : super(message, "");
}

class RequestEntityTooLargeException extends ApiException {
  RequestEntityTooLargeException([message]) : super(message, "");
}

class UnsupportedMediaException extends ApiException {
  UnsupportedMediaException([message]) : super(message, "");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "");
}

class ForbiddenException extends ApiException {
  ForbiddenException([message]) : super(message, "");
}

class InvalidInputException extends ApiException {
  InvalidInputException([message]) : super(message, "");
}