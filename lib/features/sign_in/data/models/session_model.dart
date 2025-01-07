
import '../../domain/entities/session_entity.dart';
import 'user_context_model.dart';

class SessionModel implements SessionEntity{
  const SessionModel({
    required this.userContext,
  });
  

  @override
  final UserContextModel userContext;
  
}
