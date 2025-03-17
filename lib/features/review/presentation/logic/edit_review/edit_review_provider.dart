import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'edit_review_state.dart';

part 'edit_review_notifier.dart';

final editReviewProvider =
    NotifierProvider.autoDispose<EditReviewNotifier, EditReviewState>(
        EditReviewNotifier.new);

final editReviewRepositoryProvider =
    Provider.autoDispose<EditReviewIRepository>((ref) {
  final dataSource = EditReviewApiDataSource();
  return EditReviewRepository(remoteDataSource: dataSource);
});

final editReviewUseCaseProvider =
    Provider.autoDispose<EditReviewUseCase>((ref) {
  final repository = ref.watch(editReviewRepositoryProvider);
  return EditReviewUseCase(repository: repository);
});
