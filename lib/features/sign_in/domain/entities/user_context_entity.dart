abstract class UserContextEntity {
  const UserContextEntity({
    required this.displayName,
    required this.email,
    required this.carBrand,
    required this.carModel,
  });

  final String displayName;
  final String email;
  final String carBrand;
  final String carModel;
}
