import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/notifier/ev_notifier.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import 'logic.dart';

part 'register_notifier.dart';

final registerProvider =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
        RegisterNotifier.new);

final registerRepositoryProvider =
    Provider.autoDispose<RegisterIRepository>((ref) {
  final dataSource = RegisterApiDataSource();
  return RegisterRepository(remoteDataSource: dataSource);
});

final registerUseCaseProvider = Provider.autoDispose<RegisterUseCase>((ref) {
  final repository = ref.watch(registerRepositoryProvider);
  return RegisterUseCase(repository: repository);
});

final registerObscurePasswordProvider = StateProvider<bool>((ref) => true);

final registerObscureConfirmPasswordProvider =
    StateProvider<bool>((ref) => true);

final registerDisplayNameErrorProvider = StateProvider<String?>((ref) => null);

final registerEmailErrorProvider = StateProvider<String?>((ref) => null);

final registerPasswordErrorProvider = StateProvider<String?>((ref) => null);

final registerConfirmPasswordErrorProvider =
    StateProvider<String?>((ref) => null);

final registerCarBrandErrorProvider = StateProvider<String?>((ref) => null);

final registerCarModelErrorProvider = StateProvider<String?>((ref) => null);
