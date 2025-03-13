import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'delete_bookmark_state.dart';

part 'delete_bookmark_notifier.dart';

final deleteBookmarkProvider =
    NotifierProvider.autoDispose<DeleteBookmarkNotifier, DeleteBookmarkState>(
        DeleteBookmarkNotifier.new);

final deleteBookmarkRepositoryProvider =
    Provider.autoDispose<DeleteBookmarkIRepository>((ref) {
  final dataSource = DeleteBookmarkApiDataSource();
  return DeleteBookmarkRepository(remoteDataSource: dataSource);
});

final deleteBookmarkUseCaseProvider =
    Provider.autoDispose<DeleteBookmarkUseCase>((ref) {
  final repository = ref.watch(deleteBookmarkRepositoryProvider);
  return DeleteBookmarkUseCase(repository: repository);
});
