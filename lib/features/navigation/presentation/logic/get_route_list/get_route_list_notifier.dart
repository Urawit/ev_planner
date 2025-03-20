part of 'get_route_list_provider.dart';

class GetRouteListNotifier extends EVNotifier<GetRouteListState> {
  @override
  build() {
    return const GetRouteListState.loading();
  }

  Future<void> getRouteList({required int tripId}) async {
    state = const GetRouteListState.loading();

    final result =
        await ref.read(getRouteListUseCaseProvider).call(tripId: tripId);

    return result.fold((error) {
      state = GetRouteListState.error(error);
    }, (result) async {
      state = GetRouteListState.data(data: result);
    });
  }
}
