import '../../data/models/models.dart';

abstract class SessionEntity {
  const SessionEntity ({
    // required this.token,
    required this.userContext,
  });
  
  final UserContextModel userContext;
}