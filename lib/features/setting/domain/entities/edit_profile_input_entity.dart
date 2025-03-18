abstract class EditProfileInputEntity {
  const EditProfileInputEntity({
    required this.userId,
    required this.displayName,
    required this.email,
    required this.carModelId,
    this.password,
  });
  final String userId;
  final String displayName;
  final String email;
  final String carModelId;
  final String? password;
}
