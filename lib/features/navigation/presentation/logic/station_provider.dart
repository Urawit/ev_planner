import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/notifier/ev_notifier.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import 'station_state.dart';

part 'station_notifier.dart';

final stationProvider =
    NotifierProvider.autoDispose<StationNotifier, StationState>(
        StationNotifier.new);

final stationRepositoryProvider =
    Provider.autoDispose<StationIRepository>((ref) {
  final dataSource = StationApiDataSource();
  return StationRepository(remoteDataSource: dataSource);
});

final stationUseCaseProvider = Provider.autoDispose<StationUseCase>((ref) {
  final repository = ref.watch(stationRepositoryProvider);
  return StationUseCase(repository: repository);
});

final googleMapPaddingProvider = StateProvider.autoDispose<double>((ref) {
  return 0.0;
});
