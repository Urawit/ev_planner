import '../../domain/entities/entities.dart';

class UserContextModel implements UserContextEntity{
  const UserContextModel({
    this.email,
    this.username,
    this.vehicleModel,
  });
  
  @override
  final String? email;

  @override
  final String? username;

  @override
  final String? vehicleModel;
  
}
