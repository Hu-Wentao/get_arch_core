class BaseException implements Exception {
  final String msg;

  BaseException(this.msg);
}

class ValidationException extends BaseException {
  ValidationException(String msg) : super(msg);
}

class IllegalArgumentException extends BaseException {
  IllegalArgumentException(String msg) : super(msg);
}
