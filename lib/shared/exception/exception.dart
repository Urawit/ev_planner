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
  ServerException({String? errorCode, String? errorMessage})
      : super(ErrorMessageModel(
            errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "ServerException";
}

class EmailExistException extends AnyException {
  EmailExistException({String? errorCode, String? errorMessage})
      : super(ErrorMessageModel(
            errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "EmailExistsException";
}

//* SignIn

class UserNotFoundException extends AnyException {
  UserNotFoundException({String? errorCode, String? errorMessage})
      : super(ErrorMessageModel(
            errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "UserNotFoundException";
}

class InvalidPasswordException extends AnyException {
  InvalidPasswordException({String? errorCode, String? errorMessage})
      : super(ErrorMessageModel(
            errorCode: errorCode, errorMessage: errorMessage));
  @override
  String get name => "InvalidPasswordException";
}
