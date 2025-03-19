import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/features/vehicle_info/logic/vehicle_provider.dart';
import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/widgets.dart';
import '../../sign_in/presentation/logic/sign_in_provider.dart';
import '../data/models/edit_profile_input_model.dart';
import 'logic/edit_profile_provider.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends ConsumerState<SettingPage> {
  final editDisplayNameErrorProvider = StateProvider<String?>((ref) => null);

  final editEmailErrorProvider = StateProvider<String?>((ref) => null);

  final editPasswordErrorProvider = StateProvider<String?>((ref) => null);

  final editConfirmPasswordErrorProvider =
      StateProvider<String?>((ref) => null);

  final editObscurePasswordProvider = StateProvider<bool>((ref) => true);

  final editObscureConfirmPasswordProvider = StateProvider<bool>((ref) => true);

  final editCarBrandErrorProvider = StateProvider<String?>((ref) => null);

  final editCarModelErrorProvider = StateProvider<String?>((ref) => null);

  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController searchBrandController = TextEditingController();
  final TextEditingController searchModelController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? selectedBrand;
  String? selectedModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      resetAllTextField();
      ref.read(vehicleProvider.notifier).getVehicleList();
      initializeUserData();
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

  void resetAllTextField() {
    ref.read(editDisplayNameErrorProvider.notifier).state = null;
    ref.read(editEmailErrorProvider.notifier).state = null;
    ref.read(editPasswordErrorProvider.notifier).state = null;
    ref.read(editConfirmPasswordErrorProvider.notifier).state = null;
    ref.read(editCarBrandErrorProvider.notifier).state = null;
    ref.read(editCarModelErrorProvider.notifier).state = null;
  }

  void initializeUserData() {
    final userContext = ref.read(userContextProvider);

    displayNameController.text = userContext?.displayName ?? '';
    emailController.text = userContext?.email ?? '';
  }

  void validation() {
    final userContext = ref.read(userContextProvider);

    final displayName = displayNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    final displayNameRegex = RegExp(r'^[a-zA-Z0-9]{8,20}$');
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,10}$');

    bool isValid = true;

    if (!displayNameRegex.hasMatch(displayName) &&
        displayName.isNotEmpty &&
        displayName != userContext?.displayName) {
      ref.read(editDisplayNameErrorProvider.notifier).state =
          "Display name must be 8-20 characters, no special characters";
      isValid = false;
    } else {
      ref.read(editDisplayNameErrorProvider.notifier).state = null;
    }

    if (!emailRegex.hasMatch(email) &&
        email.isNotEmpty &&
        email != userContext?.email) {
      ref.read(editEmailErrorProvider.notifier).state =
          "Please enter a valid email address";
      isValid = false;
    } else {
      ref.read(editEmailErrorProvider.notifier).state = null;
    }

    if (!passwordRegex.hasMatch(password) && password != '') {
      ref.read(editPasswordErrorProvider.notifier).state =
          "Password must be 8-10 characters, with at least 1 uppercase letter, 1 number, and 1 special character.";
      isValid = false;
    } else {
      ref.read(editPasswordErrorProvider.notifier).state = null;
    }

    if (confirmPassword != password && password != '') {
      ref.read(editConfirmPasswordErrorProvider.notifier).state =
          "Passwords do not match";
      isValid = false;
    } else {
      ref.read(editConfirmPasswordErrorProvider.notifier).state = null;
    }

    if (isValid) {
      final finalDisplayName =
          displayName.isEmpty ? (userContext?.displayName ?? '') : displayName;
      final finalEmail = email.isEmpty ? (userContext?.email ?? '') : email;
      final finalSelectedModel =
          selectedModel ?? (userContext?.carModelId ?? '');

      ref.read(editProfileProvider.notifier).editProfile(
          editProfileInput: EditProfileInputModel(
              carModelId: finalSelectedModel,
              userId: userContext?.userId ?? '',
              displayName: finalDisplayName,
              email: finalEmail,
              password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCarBrandError = ref.watch(editCarBrandErrorProvider);
    final isCarModelError = ref.watch(editCarModelErrorProvider);
    final vehicleState = ref.watch(vehicleProvider);

    ref.listen(editProfileProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          showFlushbar(
            context: context,
            title: 'Edit Profile Successful',
            message: 'Your profile has been successfully updated.',
            backgroundColor: Colors.green,
          );
        },
        error: (_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Edit profile have failed, Please retry again',
            buttonLabel: 'retry',
          );
        },
      );
    });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text("SETTING PAGE", style: EVDesignSystem.textStyles.headline3),
              //TODO implement profile image
              const SizedBox(height: 60),
              CustomTextField(
                  controller: displayNameController,
                  label: 'Display Name',
                  errorProvider: editDisplayNameErrorProvider),
              const SizedBox(height: 24),
              CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  errorProvider: editEmailErrorProvider),
              const SizedBox(height: 24),
              PasswordTextField(
                controller: passwordController,
                label: 'Password',
                errorProvider: editPasswordErrorProvider,
                obscureProvider: editObscurePasswordProvider,
              ),
              const SizedBox(height: 24),
              PasswordTextField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                errorProvider: editConfirmPasswordErrorProvider,
                obscureProvider: editObscureConfirmPasswordProvider,
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
                      ref.read(editCarBrandErrorProvider.notifier).state = null;
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
                        ref.read(editCarModelErrorProvider.notifier).state =
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
                          onPressed: validation,
                          child: const Text('Apply')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
