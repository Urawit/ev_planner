
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/notifier/ev_notifier.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import 'logic.dart';

part 'sign_in_notifier.dart';

final signInProvider = NotifierProvider.autoDispose<SignInNotifier, SignInState>(SignInNotifier.new);

final signInRepositoryProvider = Provider.autoDispose<SignInIRepository>((ref) {
  // TODO change to datasource
  final dataSource = SignInMockDataSource();
  return SignInRepository(remoteDataSource: dataSource);
});

final signInUseCaseProvider = Provider.autoDispose<SignInUseCase>((ref) {
  final repository = ref.watch(signInRepositoryProvider);
  return SignInUseCase(repository: repository);
});