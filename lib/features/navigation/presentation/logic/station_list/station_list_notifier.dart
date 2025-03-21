part of 'station_list_provider.dart';

class StationListNotifier extends EVNotifier<StationListState> {
  @override
  build() {
    return const StationListState.loading();
  }

  Future<void> getStationList() async {
    state = const StationListState.loading();

    final result = await ref.read(stationListUseCaseProvider).call();

    return result.fold((error) {
      state = StationListState.error(error);
    }, (result) async {
      state = StationListState.data(data: result);
    });
  }
}
