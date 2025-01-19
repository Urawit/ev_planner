abstract class ErrorMessageEntity {
  const ErrorMessageEntity({
    this.errorCode,
    this.errorMessage
  });

  final String? errorCode;
  final String? errorMessage;
}