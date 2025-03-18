import '../../domain/entities/edit_profile_input_entity.dart';

class EditProfileInputModel implements EditProfileInputEntity {
  const EditProfileInputModel({
    required this.userId,
    required this.displayName,
    required this.email,
    required this.carModelId,
    this.password,
  });
  @override
  final String userId;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String carModelId;
  @override
  final String? password;
}
