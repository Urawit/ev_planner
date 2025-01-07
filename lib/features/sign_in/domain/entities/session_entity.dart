import '../../data/models/models.dart';

abstract class SessionEntity {
  const SessionEntity ({
    // required this.token,
    // this.refreshTolen
    required this.userContext,
  });
  
  final UserContextModel userContext;
}