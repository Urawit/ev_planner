part of 'station_provider.dart';

class StationNotifier extends EVNotifier<StationState> {
  @override
  build() {
    return const StationState.loading();
  }

  Future<void> getStationList() async {
    state = const StationState.loading();

    final result = await ref.read(stationUseCaseProvider).call();

    return result.fold((error) {
      state = StationState.error(error);
    }, (result) async {
      state = StationState.data(data: result);
    });
  }
}
