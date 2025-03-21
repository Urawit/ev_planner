import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'result_state.dart';

part 'result_notifier.dart';

final resultProvider =
    NotifierProvider.autoDispose<ResultNotifier, ResultState>(
        ResultNotifier.new);

final resultRepositoryProvider = Provider.autoDispose<ResultIRepository>((ref) {
  final dataSource = ResultApiDataSource();
  return ResultRepository(remoteDataSource: dataSource);
});

final resultUseCaseProvider = Provider.autoDispose<ResultUseCase>((ref) {
  final repository = ref.watch(resultRepositoryProvider);
  return ResultUseCase(repository: repository);
});
