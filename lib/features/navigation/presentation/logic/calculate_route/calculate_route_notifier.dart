part of 'calculate_route_provider.dart';

class CalculateRouteNotifier extends EVNotifier<CalculateRouteState> {
  @override
  build() {
    return const CalculateRouteState.loading();
  }

  Future<void> getCalculateRouteList(
      {required CalculateRouteInputEntity calculateRouteInput}) async {
    state = const CalculateRouteState.loading();

    final result = await ref
        .read(calculateRouteUseCaseProvider)
        .call(calculateRouteInput: calculateRouteInput);

    return result.fold((error) {
      state = CalculateRouteState.error(error);
    }, (result) async {
      state = CalculateRouteState.success(tripId: result);
    });
  }
}
