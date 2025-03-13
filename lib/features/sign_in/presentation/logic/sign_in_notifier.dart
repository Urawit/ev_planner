part of 'sign_in_provider.dart';

class SignInNotifier extends EVNotifier<SignInState> {
  @override
  build() {
    return const SignInState.initial();
  }

  Future<void> signIn({required SignInInputEntity signInInput}) async {
    state = const SignInState.loading();

    final result =
        await ref.read(signInUseCaseProvider).call(signInInput: signInInput);

    return result.fold((error) {
      state = SignInState.error(error);
    }, (result) async {
      state = SignInState.success(data: result);

      ref.read(userContextProvider.notifier).state = result;
    });
  }
}
