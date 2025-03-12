part of 'station_detail_provider.dart';

class StationDetailNotifier extends EVNotifier<StationDetailState> {
  @override
  build() {
    return const StationDetailState.loading();
  }

  Future<void> getStationDetail({required String stationId}) async {
    state = const StationDetailState.loading();

    final result =
        await ref.read(stationDetailUseCaseProvider).call(stationId: stationId);

    return result.fold((error) {
      state = StationDetailState.error(error);
    }, (result) async {
      state = StationDetailState.data(data: result);
    });
  }
}
