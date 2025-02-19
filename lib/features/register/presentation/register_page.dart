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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
    final isConfirmPasswordObscure = ref.watch(registerObscureConfirmPasswordProvider);

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
                padding: const EdgeInsets.only(left: 27, bottom: 40),
                child: Text('Sign up !',
                    style: EVDesignSystem.textStyles.headline1),
              ),
            ),
             SizedBox(
                width: 327,
                child: TextField(
                    onChanged: (_) {
                      ref.read(registerDisplayNameErrorProvider.notifier).state = null;
                    },
                    controller: displayNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDisplayNameError != null ? Colors.red : Colors.grey,
                        ),
                      ),
                      labelText: 'Display Nmae',
                      errorText: isDisplayNameError,
                    ))),
            // SizedBox(
            //     width: 327,
            //     child: TextField(
            //         onChanged: (_) {
            //           ref.read(signInEmailErrorProvider.notifier).state = null;
            //         },
            //         controller: emailController,
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color:
            //                   isEmailError != null ? Colors.red : Colors.grey,
            //             ),
            //           ),
            //           labelText: 'Email',
            //           errorText: isEmailError,
            //         ))),
            // const SizedBox(height: 24),
            // SizedBox(
            //   width: 327,
            //   child: TextField(
            //     onChanged: (_) {
            //       ref.read(signInPasswordErrorProvider.notifier).state = null;
            //     },
            //     controller: passwordController,
            //     obscureText: isObscure,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: isPasswordError != null ? Colors.red : Colors.grey,
            //         ),
            //       ),
            //       errorText: isPasswordError,
            //       labelText: 'Password',
            //       suffixIcon: IconButton(
            //         icon: Icon(
            //           isObscure ? Icons.visibility_off : Icons.visibility,
            //         ),
            //         onPressed: () {
            //           ref.read(signInObscurePasswordProvider.notifier).state =
            //               !isObscure;
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Color(0xFFEB7A29), // Button color
            //               foregroundColor: Colors.white, // Text color
            //               padding: const EdgeInsets.symmetric(vertical: 16), // Optional: Adjust padding
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
            //               ),
            //             ),
            //             onPressed: validate,
            //             child: const Text('Login')),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 24),
            // GestureDetector(
            //   onTap: () => context.go('/register'),
            //   child: const Text(
            //     "New here? SIGN UP",
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
