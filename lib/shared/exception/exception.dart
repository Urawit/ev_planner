

import '../error/error_message_model.dart';

class AnyException implements Exception {
  const AnyException(this.error);

  final ErrorMessageModel error;

  String get name => 'AnyException';

  @override
  String toString() {
    return 'name=$name, statusCode=${error.errorCode}\nmessage=${error.errorMessage}';
  }
}

class ServerException extends AnyException {
  ServerException({String? errorCode, String? errorMessage}) : super(ErrorMessageModel(errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "ServerException";
}

class InvalidInputException extends AnyException {
  InvalidInputException({String? errorCode, String? errorMessage}) : super(ErrorMessageModel(errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "InvalidInputException";
}
