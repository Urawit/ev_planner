import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'rate_state.dart';

part 'rate_notifier.dart';

final rateProvider =
    NotifierProvider.autoDispose<RateNotifier, RateState>(RateNotifier.new);

final rateRepositoryProvider = Provider.autoDispose<RateIRepository>((ref) {
  final dataSource = RateApiDataSource();
  return RateRepository(remoteDataSource: dataSource);
});

final rateUseCaseProvider = Provider.autoDispose<RateUseCase>((ref) {
  final repository = ref.watch(rateRepositoryProvider);
  return RateUseCase(repository: repository);
});
