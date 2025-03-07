abstract class RegisterInputEntity {
  const RegisterInputEntity({
    required this.displayName,
    required this.email,
    required this.password,
    required this.carModelId,
  });

  final String displayName;
  final String email;
  final String password;
  final String carModelId;
}
