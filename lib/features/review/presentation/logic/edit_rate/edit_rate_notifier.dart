part of 'edit_rate_provider.dart';

class EditRateNotifier extends EVNotifier<EditRateState> {
  @override
  build() {
    return const EditRateState.loading();
  }

  Future<void> editRate({required RateInputEntity rateInput}) async {
    state = const EditRateState.loading();

    final result =
        await ref.read(editRateUseCaseProvider).call(rateInput: rateInput);

    return result.fold((error) {
      state = EditRateState.error(error);
    }, (result) async {
      state = const EditRateState.success();
    });
  }
}
