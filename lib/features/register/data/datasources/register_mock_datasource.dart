import 'package:ev_planner/shared/exception/exception.dart';

import '../../../../shared/error/error_message_model.dart';
import '../../domain/entities/entities.dart';
import '../data.dart';

class RegisterMockDataSource implements RegisterIDataSource {
  @override
  Future<RegisterResultEntity> register(
      {required RegisterInputEntity registerInput}) async {
    if (registerInput.email.isNotEmpty) {
      return const RegisterResultModel(success: true);
    } else {
      throw const AnyException(ErrorMessageModel());
    }
  }
}
