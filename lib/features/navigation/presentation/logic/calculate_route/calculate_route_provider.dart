import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'calculate_route_state.dart';

part 'calculate_route_notifier.dart';

final calculateRouteProvider =
    NotifierProvider.autoDispose<CalculateRouteNotifier, CalculateRouteState>(
        CalculateRouteNotifier.new);

final calculateRouteRepositoryProvider =
    Provider.autoDispose<CalculateRouteIRepository>((ref) {
  final dataSource = CalculateRouteApiDataSource();
  return CalculateRouteRepository(remoteDataSource: dataSource);
});

final calculateRouteUseCaseProvider =
    Provider.autoDispose<CalculateRouteUseCase>((ref) {
  final repository = ref.watch(calculateRouteRepositoryProvider);
  return CalculateRouteUseCase(repository: repository);
});

final currentBatteryProvider = StateProvider<double?>((ref) => null);
