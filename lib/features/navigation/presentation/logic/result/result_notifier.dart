part of 'result_provider.dart';

class ResultNotifier extends EVNotifier<ResultState> {
  @override
  build() {
    return const ResultState.loading();
  }

  Future<void> calculateResult({required ResultInputEntity resultInput}) async {
    state = const ResultState.loading();

    final result =
        await ref.read(resultUseCaseProvider).call(resultInput: resultInput);

    return result.fold((error) {
      state = ResultState.error(error);
    }, (result) async {
      state = ResultState.data(resultId: result);
    });
  }
}
