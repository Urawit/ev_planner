part of 'vehicle_provider.dart';

class VehicleNotifier extends EVNotifier<VehicleState> {
  @override
  build() {
    return const VehicleState.loading();
  }

  Future<void> getVehicle() async {
    state = const VehicleState.loading();

    final result = await ref.read(vehicleUseCaseProvider).call();

    return result.fold((error) {
      state = VehicleState.error(error);
    }, (result) async {
      state = VehicleState.data(data: result);
    });
  }
}
