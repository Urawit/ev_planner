part of 'rate_provider.dart';

class RateNotifier extends EVNotifier<RateState> {
  @override
  build() {
    return const RateState.loading();
  }

  Future<void> rate({required RateInputEntity rateInput}) async {
    state = const RateState.loading();

    final result =
        await ref.read(rateUseCaseProvider).call(rateInput: rateInput);

    return result.fold((error) {
      state = RateState.error(error);
    }, (result) async {
      state = const RateState.success();
    });
  }
}
