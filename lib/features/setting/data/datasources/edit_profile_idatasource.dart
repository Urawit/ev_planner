import '../../domain/entities/edit_profile_input_entity.dart';

abstract class EditProfileIDataSource {
  Future<void> editProfile({required EditProfileInputEntity editProfileInput});
}
