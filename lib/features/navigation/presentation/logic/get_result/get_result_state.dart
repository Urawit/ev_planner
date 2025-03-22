import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/get_result_entity.dart';

part 'get_result_state.freezed.dart';

@freezed
abstract class GetResultState with _$GetResultState {
  const GetResultState._();

  const factory GetResultState.loading() = _GetResultStateLoading;
  const factory GetResultState.data({required GetResultEntity data}) =
      _GetResultStateData;
  const factory GetResultState.error(AnyException error) = _GetResultStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
