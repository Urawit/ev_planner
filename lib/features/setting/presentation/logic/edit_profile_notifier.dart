part of 'edit_profile_provider.dart';

class EditProfileNotifier extends EVNotifier<EditProfileState> {
  @override
  build() {
    return const EditProfileState.loading();
  }

  Future<void> editProfile(
      {required EditProfileInputEntity editProfileInput}) async {
    state = const EditProfileState.loading();

    final result = await ref
        .read(editProfileUseCaseProvider)
        .call(editProfileInput: editProfileInput);

    return result.fold((error) {
      state = EditProfileState.error(error);
    }, (result) async {
      state = const EditProfileState.success();
    });
  }
}
