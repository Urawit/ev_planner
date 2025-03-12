import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'station_detail_state.dart';

part 'station_detail_notifier.dart';

final stationDetailProvider =
    NotifierProvider.autoDispose<StationDetailNotifier, StationDetailState>(
        StationDetailNotifier.new);

final stationDetailRepositoryProvider =
    Provider.autoDispose<StationDetailIRepository>((ref) {
  final dataSource = StationDetailApiDataSource();
  return StationDetailRepository(remoteDataSource: dataSource);
});

final stationDetailUseCaseProvider =
    Provider.autoDispose<StationDetailUseCase>((ref) {
  final repository = ref.watch(stationDetailRepositoryProvider);
  return StationDetailUseCase(repository: repository);
});
