import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/notifier/ev_notifier.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import 'edit_profile_state.dart';

part 'edit_profile_notifier.dart';

final editProfileProvider =
    NotifierProvider.autoDispose<EditProfileNotifier, EditProfileState>(
        EditProfileNotifier.new);

final editProfileRepositoryProvider =
    Provider.autoDispose<EditProfileIRepository>((ref) {
  final dataSource = EditProfileApiDataSource();
  return EditProfileRepository(remoteDataSource: dataSource);
});

final editProfileUseCaseProvider =
    Provider.autoDispose<EditProfileUseCase>((ref) {
  final repository = ref.watch(editProfileRepositoryProvider);
  return EditProfileUseCase(repository: repository);
});
