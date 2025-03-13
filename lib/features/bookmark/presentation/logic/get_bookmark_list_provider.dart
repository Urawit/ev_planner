import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import 'get_bookmark_list_state.dart';

part 'get_bookmark_list_notifier.dart';

final getBookmarkListProvider =
    NotifierProvider.autoDispose<GetBookmarkListNotifier, GetBookmarkListState>(
        GetBookmarkListNotifier.new);

final getBookmarkListRepositoryProvider =
    Provider.autoDispose<GetBookmarkListIRepository>((ref) {
  final dataSource = GetBookmarkListApiDataSource();
  return GetBookmarkListRepository(remoteDataSource: dataSource);
});

final getBookmarkListUseCaseProvider =
    Provider.autoDispose<GetBookmarkListUseCase>((ref) {
  final repository = ref.watch(getBookmarkListRepositoryProvider);
  return GetBookmarkListUseCase(repository: repository);
});
