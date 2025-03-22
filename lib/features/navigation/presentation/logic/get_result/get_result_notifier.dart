part of 'get_result_provider.dart';

class GetResultNotifier extends EVNotifier<GetResultState> {
  @override
  build() {
    return const GetResultState.loading();
  }

  Future<void> getResult({required int resultId}) async {
    state = const GetResultState.loading();

    final result =
        await ref.read(getResultUseCaseProvider).call(resultId: resultId);

    return result.fold((error) {
      state = GetResultState.error(error);
    }, (result) async {
      state = GetResultState.data(data: result);
    });
  }
}
