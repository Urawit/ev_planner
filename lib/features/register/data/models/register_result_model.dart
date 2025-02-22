import '../../domain/entities/register_result_entity.dart';

class RegisterResultModel implements RegisterResultEntity {
  const RegisterResultModel({
    required this.success,
  });

  @override
  final bool success;
}
