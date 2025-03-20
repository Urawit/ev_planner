import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import 'get_route_list_state.dart';

part 'get_route_list_notifier.dart';

final getRouteListProvider =
    NotifierProvider.autoDispose<GetRouteListNotifier, GetRouteListState>(
        GetRouteListNotifier.new);

final getRouteListRepositoryProvider =
    Provider.autoDispose<GetRouteListIRepository>((ref) {
  final dataSource = GetRouteListApiDataSource();
  return GetRouteListRepository(remoteDataSource: dataSource);
});

final getRouteListUseCaseProvider =
    Provider.autoDispose<GetRouteListUseCase>((ref) {
  final repository = ref.watch(getRouteListRepositoryProvider);
  return GetRouteListUseCase(repository: repository);
});
