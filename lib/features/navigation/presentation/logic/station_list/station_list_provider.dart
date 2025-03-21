import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'station_list_state.dart';

part 'station_list_notifier.dart';

final stationListProvider =
    NotifierProvider.autoDispose<StationListNotifier, StationListState>(
        StationListNotifier.new);

final stationListRepositoryProvider =
    Provider.autoDispose<StationListIRepository>((ref) {
  final dataSource = StationListApiDataSource();
  return StationListRepository(remoteDataSource: dataSource);
});

final stationListUseCaseProvider =
    Provider.autoDispose<StationListUseCase>((ref) {
  final repository = ref.watch(stationListRepositoryProvider);
  return StationListUseCase(repository: repository);
});
