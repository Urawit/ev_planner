abstract class UserContextEntity {
  const UserContextEntity ({
    this.username,
    this.email,
    this.vehicleModel,
  });

  final String? username;
  final String? email;
  final String? vehicleModel;
}