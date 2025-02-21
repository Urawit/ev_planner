import 'package:flutter_riverpod/flutter_riverpod.dart';



final registerObscurePasswordProvider = StateProvider<bool>((ref) => true);

final registerObscureConfirmPasswordProvider = StateProvider<bool>((ref) => true);

final registerDisplayNameErrorProvider = StateProvider<String?>((ref) => null);

final registerEmailErrorProvider = StateProvider<String?>((ref) => null);

final registerPasswordErrorProvider = StateProvider<String?>((ref) => null);

final registerConfirmPasswordErrorProvider = StateProvider<String?>((ref) => null);

