import '../../domain/entities/sign_in_entity.dart';

class SignInInputModel implements SignInInputEntity {
  const SignInInputModel({required this.email, required this.password});

  @override
  final String email;

  @override
  final String password;
}
