import '../../domain/entities/entities.dart';

class UserContextModel implements UserContextEntity {
  const UserContextModel({
    required this.email,
    required this.displayName,
    required this.carBrand,
    required this.carModel,
  });

  @override
  final String email;

  @override
  final String displayName;

  @override
  final String carBrand;

  @override
  final String carModel;
}
