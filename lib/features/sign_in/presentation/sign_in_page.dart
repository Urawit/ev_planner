import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/ev_design_system.dart';
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

  void validate() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    bool isValid = true;

    if (email.isEmpty) {
      ref.read(emailErrorProvider.notifier).state = "Please enter your email";
      isValid = false;
    } else {
      ref.read(emailErrorProvider.notifier).state = null;
    }

    if (password.isEmpty) {
      ref.read(passwordErrorProvider.notifier).state =
          "Please enter your password";
      isValid = false;
    } else {
      ref.read(passwordErrorProvider.notifier).state = null;
    }

    if (isValid) {
      ref.read(signInProvider.notifier).signIn(
            email: email,
            password: password,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isObscure = ref.watch(obscurePasswordProvider);
    final isEmailError = ref.watch(emailErrorProvider);
    final isPasswordError = ref.watch(passwordErrorProvider);

    //TODO validation with ref.listen and navigation
    ref.listen(signInProvider, (previous, next) {
      next.whenOrNull(
        success: (_) {
          Navigator.pushReplacementNamed(context, '/home');
        },
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
            SizedBox(
                width: 327,
                child: TextField(
                    onChanged: (_) {
                      ref.read(emailErrorProvider.notifier).state = null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isEmailError != null ? Colors.red : Colors.grey,
                        ),
                      ),
                      labelText: 'Email',
                      errorText: isEmailError,
                    ))),
            const SizedBox(height: 24),
            SizedBox(
              width: 327,
              child: TextField(
                onChanged: (_) {
                  ref.read(passwordErrorProvider.notifier).state = null;
                },
                controller: passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordError != null ? Colors.red : Colors.grey,
                    ),
                  ),
                  errorText: isPasswordError,
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      ref.read(obscurePasswordProvider.notifier).state =
                          !isObscure;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: null,
                        onPressed: validate,
                        child: const Text('Login')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "New here? SIGN UP",
                style: TextStyle(
                  color: Colors.blue, // Make it look like a link
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
