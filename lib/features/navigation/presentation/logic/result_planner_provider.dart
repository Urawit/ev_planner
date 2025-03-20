import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/station_distance_entity.dart';

//TODO DELETE

// DISTANCE
final stationDistanceProvider =
    StateProvider<List<StationDistanceEntity>>((ref) => []);

// kept Start and Destination LATLONG
final startLatLongProvider = StateProvider<LatLng?>((ref) => null);
final destinationLatLongProvider = StateProvider<LatLng?>((ref) => null);
