import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'post_review_state.dart';

part 'post_review_notifier.dart';

final postReviewProvider =
    NotifierProvider.autoDispose<PostReviewNotifier, PostReviewState>(
        PostReviewNotifier.new);

final postReviewRepositoryProvider =
    Provider.autoDispose<PostReviewIRepository>((ref) {
  final dataSource = PostReviewApiDataSource();
  return PostReviewRepository(remoteDataSource: dataSource);
});

final postReviewUseCaseProvider =
    Provider.autoDispose<PostReviewUseCase>((ref) {
  final repository = ref.watch(postReviewRepositoryProvider);
  return PostReviewUseCase(repository: repository);
});
