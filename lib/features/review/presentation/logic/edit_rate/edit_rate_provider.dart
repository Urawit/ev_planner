import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'edit_rate_state.dart';

part 'edit_rate_notifier.dart';

final editRateProvider =
    NotifierProvider.autoDispose<EditRateNotifier, EditRateState>(
        EditRateNotifier.new);

final editRateRepositoryProvider =
    Provider.autoDispose<EditRateIRepository>((ref) {
  final dataSource = EditRateApiDataSource();
  return EditRateRepository(remoteDataSource: dataSource);
});

final editRateUseCaseProvider = Provider.autoDispose<EditRateUseCase>((ref) {
  final repository = ref.watch(editRateRepositoryProvider);
  return EditRateUseCase(repository: repository);
});
