import 'package:ev_planner/features/navigation/presentation/plug_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../domain/entities/trip_result_entity.dart';
import '../domain/entities/route_entity.dart';
import '../domain/entities/charging_info_entity.dart';

class RouteSelectionPageDataModel {
  const RouteSelectionPageDataModel(
      {required this.tripResultData,
      required this.startLatLong,
      required this.destLatLong,
      required this.stationIdList,
      required this.travelDurationInHours,
      required this.totalDistance});

  final TripResultEntity tripResultData;
  final LatLng startLatLong;
  final LatLng destLatLong;
  final List<String> stationIdList;
  final double travelDurationInHours;
  final double totalDistance;
}

class RouteSelectionPage extends ConsumerStatefulWidget {
  const RouteSelectionPage({
    required this.data,
    super.key,
  });

  final RouteSelectionPageDataModel data;

  @override
  RouteSelectionPageState createState() => RouteSelectionPageState();
}

class RouteSelectionPageState extends ConsumerState<RouteSelectionPage> {
  RouteEntity? selectedRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVDesignSystem.colors.grey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 14.0, top: 15),
          child: Text("Choose a Charging Plan"),
        ),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.tripResultData.routeList.length,
              itemBuilder: (context, index) {
                final route = widget.data.tripResultData.routeList[index];
                return _buildRouteCard(route, index);
              },
            ),
          ),
          if (selectedRoute != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEB7A29),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                context.push('/plug-selection',
                    extra: PlugSelectionPageDataModel(
                      tripResultData: widget.data.tripResultData,
                      routeId: selectedRoute?.routeId ?? 0,
                      startLatLong: widget.data.startLatLong,
                      destLatLong: widget.data.destLatLong,
                      stationIdList: widget.data.stationIdList,
                      travelDurationInHours: widget.data.travelDurationInHours,
                      totalDistance: widget.data.totalDistance,
                    ));
              },
              child: const Text("Confirm Route"),
            ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _buildRouteCard(RouteEntity route, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRoute = route;
        });
      },
      child: Card(
        elevation: 6,
        shadowColor: Colors.black26,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        color: selectedRoute == route ? Colors.blue.shade100 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Route #${index + 1}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...route.chargingInfoList.map(_buildChargingInfo).toList(),
              const Divider(),
              Text(
                  "🔋 Battery on Arrival: ${route.remainingBatteryAtDestination.toStringAsFixed(1)}%",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChargingInfo(ChargingInfoEntity chargingInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("⚡ ${chargingInfo.stationName}",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(
              "🔋 Charge: ${chargingInfo.batteryAtStation?.toStringAsFixed(1)}% → ${chargingInfo.chargeTo?.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 13)),
          Text("🔺 Energy Used: ${chargingInfo.energyUsedWhenCharge}%",
              style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
