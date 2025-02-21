import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/theme/ev_design_system.dart';
import 'logic/register_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // void validate() {
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();

  //   bool isValid = true;

  //   if (email.isEmpty) {
  //     ref.read(signInEmailErrorProvider.notifier).state = "Please enter your email";
  //     isValid = false;
  //   } else {
  //     ref.read(signInEmailErrorProvider.notifier).state = null;
  //   }

  //   if (password.isEmpty) {
  //     ref.read(signInPasswordErrorProvider.notifier).state =
  //         "Please enter your password";
  //     isValid = false;
  //   } else {
  //     ref.read(signInPasswordErrorProvider.notifier).state = null;
  //   }

  //   if (isValid) {
  //     ref.read(signInProvider.notifier).signIn(
  //           email: email,
  //           password: password,
  //         );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final isPasswordObscure = ref.watch(registerObscurePasswordProvider);
    final isConfirmPasswordObscure =
        ref.watch(registerObscureConfirmPasswordProvider);

    final isDisplayNameError = ref.watch(registerDisplayNameErrorProvider);
    final isEmailError = ref.watch(registerEmailErrorProvider);
    final isPasswordError = ref.watch(registerPasswordErrorProvider);

    // ref.listen(signInProvider, (previous, next) {
    //   next.whenOrNull(
    //     success: (_) {
    //       context.go('/navigation');
    //     },
    //     //TODO Handle error
    //     error: (error) {
    //       // if (error is InvalidCredentialsException) {
    //       // } else if (error is UserNotFoundException) {
    //       // } else if (error is AccountLockedException) {
    //       // } else {}
    //     },
    //   );
    // });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 27, bottom: 8),
                child: Text('Sign up !',
                    style: EVDesignSystem.textStyles.headline1),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 27, bottom: 40),
                child: Text('Create and account to get started',
                    style: EVDesignSystem.textStyles.normal1),
              ),
            ),
            SizedBox(
                width: 327,
                child: TextField(
                    onChanged: (_) {
                      ref
                          .read(registerDisplayNameErrorProvider.notifier)
                          .state = null;
                    },
                    controller: displayNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDisplayNameError != null
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: EVDesignSystem.colors.orange,
                        ),
                      ),
                      labelText: 'Display Name',
                      labelStyle: const TextStyle(color: Colors.black),
                      errorText: isDisplayNameError,
                    ))),
            const SizedBox(height: 24),
            SizedBox(
                width: 327,
                child: TextField(
                    onChanged: (_) {
                      ref.read(registerEmailErrorProvider.notifier).state =
                          null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isEmailError != null ? Colors.red : Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: EVDesignSystem.colors.orange,
                        ),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      errorText: isEmailError,
                    ))),
            const SizedBox(height: 24),
            SizedBox(
              width: 327,
              child: TextField(
                onChanged: (_) {
                  ref.read(registerPasswordErrorProvider.notifier).state = null;
                },
                controller: passwordController,
                obscureText: isConfirmPasswordObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordError != null ? Colors.red : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
l                    ),
                  ),
                  errorText: isPasswordError,
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      ref.read(registerObscurePasswordProvider.notifier).state =
                          !isPasswordObscure;
                    },
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 327,
              child: TextField(
                onChanged: (_) {
                  ref.read(registerConfirmPasswordErrorProvider.notifier).state = null;
                },
                controller: confirmPasswordController,
                obscureText: isConfirmPasswordObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isConfirmPasswordError != null ? Colors.red : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: EVDesignSystem.colors.orange,
                    ),
                  ),
                  errorText: isConfirmPasswordError,
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      ref.read(registerObscureConfirmPasswordProvider.notifier).state =
                          !isConfirmPasswordObscure;
                    },
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEB7A29),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: nullChecking,
                        child: const Text('Register')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
