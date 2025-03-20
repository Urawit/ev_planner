import '../../domain/entities/trip_result_entity.dart';

abstract class GetRouteListIDataSource {
  Future<TripResultEntity> getRouteList({required int tripId});
}
