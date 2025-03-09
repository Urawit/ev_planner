import '../../domain/entities/register_input_entity.dart';

class RegisterInputModel implements RegisterInputEntity {
  const RegisterInputModel({
    required this.displayName,
    required this.email,
    required this.password,
    required this.carModelId,
  });

  @override
  final String displayName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String carModelId;
}
