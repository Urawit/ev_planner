import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/exception/exception.dart';
import '../../../shared/features/vehicle_info/logic/vehicle_provider.dart';
import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/widgets.dart';
import '../data/models/register_input_model.dart';
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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController searchBrandController = TextEditingController();
  final TextEditingController searchModelController = TextEditingController();

  String? selectedBrand;
  String? selectedModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(vehicleProvider.notifier).getVehicleList();
    });
  }

  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void nullChecking() {
    final displayName = displayNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    bool isValid = true;

    if (displayName.isEmpty) {
      ref.read(registerDisplayNameErrorProvider.notifier).state =
          "Please enter your display name";
      isValid = false;
    } else {
      ref.read(registerDisplayNameErrorProvider.notifier).state = null;
    }

    if (email.isEmpty) {
      ref.read(registerEmailErrorProvider.notifier).state =
          "Please enter your email";
      isValid = false;
    } else {
      ref.read(registerEmailErrorProvider.notifier).state = null;
    }

    if (password.isEmpty) {
      ref.read(registerPasswordErrorProvider.notifier).state =
          "Please enter your password";
      isValid = false;
    } else {
      ref.read(registerPasswordErrorProvider.notifier).state = null;
    }

    if (confirmPassword.isEmpty) {
      ref.read(registerConfirmPasswordErrorProvider.notifier).state =
          "Please type your password again";
      isValid = false;
    } else {
      ref.read(registerConfirmPasswordErrorProvider.notifier).state = null;
    }

    if (selectedBrand == null) {
      ref.read(registerCarBrandErrorProvider.notifier).state =
          "Please select your car brand";
      isValid = false;
    } else {
      ref.read(registerCarBrandErrorProvider.notifier).state = null;
    }

    if (selectedModel == null) {
      ref.read(registerCarModelErrorProvider.notifier).state =
          "Please select your car model";
      isValid = false;
    } else {
      ref.read(registerCarModelErrorProvider.notifier).state = null;
    }

    if (isValid) {
      ref.read(registerProvider.notifier).register(
            registerInput: RegisterInputModel(
                displayName: displayName,
                email: email,
                password: password,
                carModelId: selectedModel ?? ''),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCarBrandError = ref.watch(registerCarBrandErrorProvider);
    final isCarModelError = ref.watch(registerCarModelErrorProvider);

    final vehicleState = ref.watch(vehicleProvider);

    ref.listen(registerProvider, (previous, next) {
      next.whenOrNull(
        success: (_) {
          context.go('/sign-in');
        },
        error: (error) {
          if (error is EmailExistException) {
            ref.read(registerEmailErrorProvider.notifier).state =
                error.error.errorMessage;
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
            padding: const EdgeInsets.only(top: 30)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
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
                child: Text('Create an account to get started',
                    style: EVDesignSystem.textStyles.normal1),
              ),
            ),
            CustomTextField(
                controller: displayNameController,
                label: 'Display Name',
                errorProvider: registerDisplayNameErrorProvider),
            const SizedBox(height: 24),
            CustomTextField(
                controller: emailController,
                label: 'Email',
                errorProvider: registerEmailErrorProvider),
            const SizedBox(height: 24),
            PasswordTextField(
              controller: passwordController,
              label: 'Password',
              errorProvider: registerPasswordErrorProvider,
              obscureProvider: registerObscurePasswordProvider,
            ),
            const SizedBox(height: 24),
            PasswordTextField(
              controller: confirmPasswordController,
              label: 'Confirm Password',
              errorProvider: registerConfirmPasswordErrorProvider,
              obscureProvider: registerObscureConfirmPasswordProvider,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 327,
              child: DropdownButtonFormField<String>(
                value: selectedBrand,
                items: vehicleState.when(
                  data: (vehicleList) {
                    return vehicleList
                        .map((vehicle) => DropdownMenuItem<String>(
                              value: vehicle.carBrandName,
                              child: Text(vehicle.carBrandName),
                            ))
                        .toList();
                  },
                  loading: () => [],
                  error: (e) => [],
                ),
                onChanged: (value) {
                  setState(() {
                    selectedBrand = value;
                    selectedModel = null;
                    ref.read(registerCarBrandErrorProvider.notifier).state =
                        null;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: EVDesignSystem.colors.orange)),
                  labelText: "Select Your Car Brand",
                  errorText: isCarBrandError,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isCarBrandError != null
                              ? Colors.red
                              : Colors.grey)),
                  labelStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (selectedBrand != null) ...[
              SizedBox(
                width: 327,
                child: DropdownButtonFormField<String>(
                  value: selectedModel,
                  items: vehicleState.when(
                    data: (vehicleList) {
                      final selectedVehicle = vehicleList.firstWhere(
                        (vehicle) => vehicle.carBrandName == selectedBrand,
                      );
                      final modelList = selectedVehicle.carModels;
                      return modelList
                          .map((model) => DropdownMenuItem<String>(
                                value: model.modelId.toString(),
                                child: Text(model.modelName),
                              ))
                          .toList();
                    },
                    loading: () => [],
                    error: (e) => [],
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedModel = value;
                      ref.read(registerCarModelErrorProvider.notifier).state =
                          null;
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: EVDesignSystem.colors.orange)),
                    labelText: "Select Your Car Model",
                    errorText: isCarModelError,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isCarModelError != null
                                ? Colors.red
                                : Colors.grey)),
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
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
