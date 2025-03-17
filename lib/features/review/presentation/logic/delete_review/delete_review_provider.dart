import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'delete_review_state.dart';

part 'delete_review_notifier.dart';

final deleteReviewProvider =
    NotifierProvider.autoDispose<DeleteReviewNotifier, DeleteReviewState>(
        DeleteReviewNotifier.new);

final deleteReviewRepositoryProvider =
    Provider.autoDispose<DeleteReviewIRepository>((ref) {
  final dataSource = DeleteReviewApiDataSource();
  return DeleteReviewRepository(remoteDataSource: dataSource);
});

final deleteReviewUseCaseProvider =
    Provider.autoDispose<DeleteReviewUseCase>((ref) {
  final repository = ref.watch(deleteReviewRepositoryProvider);
  return DeleteReviewUseCase(repository: repository);
});
