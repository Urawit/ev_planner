import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'get_result_state.dart';

part 'get_result_notifier.dart';

final getResultProvider =
    NotifierProvider.autoDispose<GetResultNotifier, GetResultState>(
        GetResultNotifier.new);

final getResultRepositoryProvider =
    Provider.autoDispose<GetResultIRepository>((ref) {
  final dataSource = GetResultApiDataSource();
  return GetResultRepository(remoteDataSource: dataSource);
});

final getResultUseCaseProvider = Provider.autoDispose<GetResultUseCase>((ref) {
  final repository = ref.watch(getResultRepositoryProvider);
  return GetResultUseCase(repository: repository);
});
