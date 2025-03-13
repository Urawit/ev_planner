import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'save_bookmark_state.dart';

part 'save_bookmark_notifier.dart';

final saveBookmarkProvider =
    NotifierProvider.autoDispose<SaveBookmarkNotifier, SaveBookmarkState>(
        SaveBookmarkNotifier.new);

final saveBookmarkRepositoryProvider =
    Provider.autoDispose<SaveBookmarkIRepository>((ref) {
  final dataSource = SaveBookmarkApiDataSource();
  return SaveBookmarkRepository(remoteDataSource: dataSource);
});

final saveBookmarkUseCaseProvider =
    Provider.autoDispose<SaveBookmarkUseCase>((ref) {
  final repository = ref.watch(saveBookmarkRepositoryProvider);
  return SaveBookmarkUseCase(repository: repository);
});
