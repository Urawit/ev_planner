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

  //TODO vehicleModel have to have Model
  // contain -> modelname brandid brandname
  @override
  final String? vehicleModel;
  
}
