import '../../domain/entities/register_input_entity.dart';

class RegisterInputModel implements RegisterInputEntity {
  const RegisterInputModel({
    required this.displayName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.carBrand,
    required this.carModel,
  });

  @override
  final String displayName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String carBrand;
  @override
  final String carModel;
}
