import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/error_popup_widget.dart';
import '../../sign_in/presentation/logic/sign_in_provider.dart';
import '../data/models/charging_info_model.dart';
import '../data/models/result_input_model.dart';
import '../domain/entities/route_entity.dart';
import '../domain/entities/trip_result_entity.dart';
import 'logic/get_result/get_result_provider.dart';
import 'logic/result/result_provider.dart';
import 'logic/station_list/station_list_provider.dart';
import 'result_with_charges_page.dart';

class PlugSelectionPageDataModel {
  const PlugSelectionPageDataModel(
      {required this.tripResultData,
      required this.routeId,
      required this.startLatLong,
      required this.destLatLong,
      required this.stationIdList,
      required this.travelDurationInHours,
      required this.totalDistance});

  final TripResultEntity tripResultData;
  final int routeId;

  final LatLng startLatLong;
  final LatLng destLatLong;
  final List<String> stationIdList;
  final double travelDurationInHours;
  final double totalDistance;
}

class PlugSelectionPage extends ConsumerStatefulWidget {
  const PlugSelectionPage({super.key, required this.data});

  final PlugSelectionPageDataModel data;

  @override
  PlugSelectionPageState createState() => PlugSelectionPageState();
}

class PlugSelectionPageState extends ConsumerState<PlugSelectionPage> {
  Map<int, Map<String, dynamic>> selectedPlugs = {};
  double? remainingBatteryAtDestination;
  RouteEntity? specificSelectedRoute;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStationList();
    });
  }

  void getStationList() {
    ref.read(stationListProvider.notifier).getStationList();
  }

  // Handle plug selection (only one plug at a time)
  void onPlugSelected(int stationId, int plugId, int energyUsedWhenCharge) {
    setState(() {
      selectedPlugs[stationId] = {
        'plugId': plugId,
        'energyUsedWhenCharge': energyUsedWhenCharge,
      };
    });
  }

  void onConfirm() {
    if (selectedPlugs.isEmpty)
      return; // Prevent submission if no plug is selected

    final userContext = ref.read(userContextProvider);

    final chargingInfoList = selectedPlugs.entries.map((entry) {
      return ChargingInfoModel(
        stationId: entry.key,
        plugId: entry.value['plugId'],
        energyUsedWhenCharge: entry.value['energyUsedWhenCharge'],
        batteryAtStation: 0.0,
        chargeTo: 0.0,
        stationName: '',
      );
    }).toList();

    ref.read(resultProvider.notifier).calculateResult(
          resultInput: ResultInputModel(
            modelId: int.tryParse(userContext?.carModelId ?? '') ?? 0,
            chargingInfoList: chargingInfoList,
          ),
        );
  }

  void listener() {
    ref.listen(resultProvider, (previous, next) {
      next.whenOrNull(
        data: (resultId) {
          ref.read(getResultProvider.notifier).getResult(resultId: resultId);
        },
        error: (error) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Planning feature have failed, Please retry again',
            buttonLabel: 'retry',
            onRetry: onConfirm,
          );
        },
      );
    });

    ref.listen(getResultProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          final selectRoute = specificSelectedRoute;
          if (selectRoute != null) {
            context.push(
              '/result-with-charges',
              extra: ResultWithChargesPageDataModel(
                  startLatLong: widget.data.startLatLong,
                  destLatLong: widget.data.destLatLong,
                  stationIdList: widget.data.stationIdList,
                  travelDurationInHours: widget.data.travelDurationInHours,
                  remainingBatteryAtDestination:
                      remainingBatteryAtDestination ?? 0,
                  totalDistance: widget.data.totalDistance,
                  result: data,
                  specificSelectedRoute: selectRoute),
            );
          }
        },
        error: (error) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Getting result have failed, Please retry again',
            buttonLabel: 'retry',
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    listener();

    final stationListState = ref.watch(stationListProvider);
    final selectedRoute = widget.data.tripResultData.routeList
        .firstWhere((route) => route.routeId == widget.data.routeId);

    specificSelectedRoute = selectedRoute;

    remainingBatteryAtDestination = selectedRoute.remainingBatteryAtDestination;

    return Scaffold(
      backgroundColor: EVDesignSystem.colors.grey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 12, top: 15),
          child: Text("Select a Plug for Charging"),
        ),
        toolbarHeight: 70,
      ),
      body: stationListState.when(
        data: (stations) {
          final selectedStations = stations.where((station) {
            return selectedRoute.chargingInfoList.any(
              (chargingInfo) =>
                  chargingInfo.stationId.toString() == station.stationId,
            );
          }).toList();

          selectedStations.sort((a, b) {
            int indexA = selectedRoute.chargingInfoList
                .indexWhere((info) => info.stationId.toString() == a.stationId);
            int indexB = selectedRoute.chargingInfoList
                .indexWhere((info) => info.stationId.toString() == b.stationId);
            return indexA.compareTo(indexB);
          });

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: selectedStations.length,
                  itemBuilder: (context, index) {
                    final station = selectedStations[index];

                    final chargingInfo =
                        selectedRoute.chargingInfoList.firstWhere(
                      (info) => info.stationId.toString() == station.stationId,
                      orElse: () => const ChargingInfoModel(
                        stationId: 0,
                        plugId: 0,
                        energyUsedWhenCharge: 0,
                        batteryAtStation: 0.0,
                        chargeTo: 0.0,
                        stationName: 'Unknown',
                      ),
                    );

                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              station.stationName ?? 'Unknown Station',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              station.address ?? 'No address available',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: (station.plugList ?? []).map((plug) {
                                  bool isSelected = selectedPlugs.containsKey(
                                          int.tryParse(station.stationId) ??
                                              -1) &&
                                      selectedPlugs[
                                              int.tryParse(station.stationId) ??
                                                  -1]?['plugId'] ==
                                          int.tryParse(plug.plugId);

                                  return GestureDetector(
                                    onTap: () {
                                      plug.status == 'unavailable' ||
                                              plug.status == 'outofservice'
                                          ? {}
                                          : onPlugSelected(
                                              int.tryParse(station.stationId) ??
                                                  0,
                                              int.tryParse(plug.plugId) ?? 0,
                                              chargingInfo.energyUsedWhenCharge,
                                            );
                                    },
                                    child: Card(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.white,
                                      elevation: isSelected ? 4.0 : 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: BorderSide(
                                          color: isSelected
                                              ? Colors.blue
                                              : Colors.grey,
                                          width: isSelected ? 2.0 : 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Plug Type: ${plug.plugType}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "Status: ${plug.status}",
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white70
                                                    : Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              "Price: Price: ${plug.price} B / kWh + ${plug.price} B / hour",
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white70
                                                    : Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEB7A29),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: (selectedPlugs.length == selectedStations.length)
                      ? onConfirm
                      : null,
                  child: const Text("Confirm Selection"),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_) {
          if (mounted) {
            errorPopupWidget(
              context: context,
              errorMessage:
                  'The Server has failed to get stations data. Please refresh the page',
              buttonLabel: 'Refresh',
              onRetry: () {
                getStationList();
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
