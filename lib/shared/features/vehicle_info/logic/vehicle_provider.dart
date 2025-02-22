import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../notifier/ev_notifier.dart';
import '../data/data.dart';
import '../domain/domain.dart';
import 'logic.dart';

part 'vehicle_notifier.dart';

final vehicleProvider =
    NotifierProvider.autoDispose<VehicleNotifier, VehicleState>(
        VehicleNotifier.new);

final vehicleRepositoryProvider =
    Provider.autoDispose<VehicleIRepository>((ref) {
  // TODO change to datasource
  final dataSource = VehicleMockDataSource();
  return VehicleRepository(remoteDataSource: dataSource);
});

final vehicleUseCaseProvider = Provider.autoDispose<VehicleUseCase>((ref) {
  final repository = ref.watch(vehicleRepositoryProvider);
  return VehicleUseCase(repository: repository);
});
