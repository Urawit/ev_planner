part of 'sign_in_provider.dart';

class SignInNotifier extends EVNotifier<SignInState>{
  @override
  build() {
    return const SignInState.initial();
  }
  Future<void> signIn({required String email, required String password}) async {
    state = const SignInState.loading();

    final input = SignInInputModel(email: email, password: password);
    
    final result = await ref.read(signInUseCaseProvider).call(signInInput: input);

    return result.fold(
      (error) {
        state = SignInState.error(error);
      }, 
      (result) async {
        state = SignInState.success(data: result);
      });
  }
}