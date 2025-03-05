import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/widgets.dart';
import '../data/models/sign_in_input_model.dart';
import 'logic/sign_in_provider.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void nullChecking() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    bool isValid = true;

    if (email.isEmpty) {
      ref.read(signInEmailErrorProvider.notifier).state =
          "Please enter your email";
      isValid = false;
    } else {
      ref.read(signInEmailErrorProvider.notifier).state = null;
    }

    if (password.isEmpty) {
      ref.read(signInPasswordErrorProvider.notifier).state =
          "Please enter your password";
      isValid = false;
    } else {
      ref.read(signInPasswordErrorProvider.notifier).state = null;
    }

    if (isValid) {
      ref.read(signInProvider.notifier).signIn(
            signInInput: SignInInputModel(email: email, password: password),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signInProvider, (previous, next) {
      next.whenOrNull(
        success: (_) {
          context.go('/navigation');
        },
        //TODO Handle error
        error: (error) {
          // if (error is InvalidCredentialsException) {
          // } else if (error is UserNotFoundException) {
          // } else if (error is AccountLockedException) {
          // } else {}
        },
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 27, bottom: 40),
                child: Text('Welcome !',
                    style: EVDesignSystem.textStyles.headline1),
              ),
            ),
            CustomTextField(
                controller: emailController,
                label: 'Email',
                errorProvider: signInEmailErrorProvider),
            const SizedBox(height: 24),
            PasswordTextField(
              controller: passwordController,
              label: 'Password',
              errorProvider: signInPasswordErrorProvider,
              obscureProvider: signInObscurePasswordProvider,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEB7A29),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: nullChecking,
                        child: const Text('Login')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => context.push('/register'),
              child: const Text(
                "New here? SIGN UP",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
