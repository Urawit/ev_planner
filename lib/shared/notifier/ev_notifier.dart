import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exception/exception.dart';

abstract class BaseState {
  AnyException? get error;
}

abstract class EVNotifier<T> extends AutoDisposeNotifier<T> {
  @override
  set state(T value) {
    super.state = value;

    if (value is BaseState) {
      if (value.error case AnyException error) {
        throw error;
      }
    }
  }
}