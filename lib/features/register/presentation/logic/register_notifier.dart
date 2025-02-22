part of 'register_provider.dart';

class RegisterNotifier extends EVNotifier<RegisterState> {
  @override
  build() {
    return const RegisterState.initial();
  }

  Future<void> register({required RegisterInputEntity registerInput}) async {
    state = const RegisterState.loading();

    final result = await ref
        .read(registerUseCaseProvider)
        .call(registerInput: registerInput);

    return result.fold((error) {
      state = RegisterState.error(error);
    }, (result) async {
      state = RegisterState.success(data: result);
    });
  }
}
