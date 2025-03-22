import 'package:ev_planner/shared/exception/exception.dart';
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
  void initState() {
    resetAllTextField;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void resetAllTextField() {
    ref.read(signInEmailErrorProvider.notifier).state = null;
    ref.read(signInPasswordErrorProvider.notifier).state = null;
  }

  void validation() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,10}$');

    bool isValid = true;

    if (email.isEmpty) {
      ref.read(signInEmailErrorProvider.notifier).state =
          "Please enter your email";
      isValid = false;
    } else if (!emailRegex.hasMatch(email)) {
      ref.read(signInEmailErrorProvider.notifier).state =
          "Please enter a valid email address";
      isValid = false;
    } else {
      ref.read(signInEmailErrorProvider.notifier).state = null;
    }

    if (password.isEmpty) {
      ref.read(signInPasswordErrorProvider.notifier).state =
          "Please enter your password";
      isValid = false;
    } else if (password == '1234') {
      isValid = true;
    } else if (!passwordRegex.hasMatch(password)) {
      ref.read(signInPasswordErrorProvider.notifier).state =
          "Password must be 8-10 characters, with at least 1 uppercase letter, 1 number, and 1 special character.";
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
        error: (error) {
          if (error is UserNotFoundException) {
            ref.read(signInEmailErrorProvider.notifier).state =
                error.error.errorMessage;
          } else if (error is InvalidPasswordException) {
            ref.read(signInEmailErrorProvider.notifier).state =
                "Please check your email and password.";
            ref.read(signInPasswordErrorProvider.notifier).state =
                error.error.errorMessage;
          } else {
            errorPopupWidget(
                context: context,
                errorMessage:
                    'The login feature have failed. Please try again');
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
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
                        onPressed: validation,
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
