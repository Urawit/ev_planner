abstract class RegisterInputEntity {
  const RegisterInputEntity({
    required this.displayName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.carBrand,
    required this.carModel,
  });

  final String displayName;
  final String email;
  final String password;
  final String confirmPassword;
  final String carBrand;
  final String carModel;
}
