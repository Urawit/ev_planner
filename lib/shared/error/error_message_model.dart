import 'error_message_entity.dart';

class ErrorMessageModel implements ErrorMessageEntity{
  const ErrorMessageModel({
    this.errorCode,
    this.errorMessage
  });

  @override
  final String? errorCode;

  @override
  final String? errorMessage;
  
}