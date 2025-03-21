import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/error_popup_widget.dart';
import '../domain/entities/trip_result_entity.dart';
import 'logic/station_list/station_list_provider.dart';

class PlugSelectionPageDataModel {
  const PlugSelectionPageDataModel({
    required this.tripResultData,
    required this.routeId,
  });

  final TripResultEntity tripResultData;
  final int routeId;
}

class PlugSelectionPage extends ConsumerStatefulWidget {
  const PlugSelectionPage({super.key, required this.data});

  final PlugSelectionPageDataModel data;

  @override
  PlugSelectionPageState createState() => PlugSelectionPageState();
}

class PlugSelectionPageState extends ConsumerState<PlugSelectionPage> {
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

  @override
  Widget build(BuildContext context) {
    final stationListState = ref.watch(stationListProvider);
    final selectedRoute = widget.data.tripResultData.routeList
        .firstWhere((route) => route.routeId == widget.data.routeId);

    return Scaffold(
      backgroundColor: EVDesignSystem.colors.grey,
      appBar: AppBar(title: const Text("Select a Plug for Charging")),
      body: stationListState.when(
          data: (stations) {
            final selectedStations = stations
                .where((station) => selectedRoute.chargingInfoList.any(
                    (info) => info.stationId.toString() == station.stationId))
                .toList();

            return ListView.builder(
              itemCount: selectedStations.length,
              itemBuilder: (context, index) {
                final station = selectedStations[index];
                return ExpansionTile(
                  title: Text(station.stationName ?? ''),
                  subtitle: Text(station.address ?? ''),
                  children: (station.plugList ?? []).map((plug) {
                    return ListTile(
                      title: Text("Plug Type: ${plug.plugType}"),
                      subtitle:
                          Text("Status: ${plug.status} | Price: ${plug.price}"),
                      onTap: () {
                        // Handle plug selection
                        print("Selected Plug ID: ${plug.plugId}");
                      },
                    );
                  }).toList(),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_) {
            if (mounted) {
              errorPopupWidget(
                context: context,
                errorMessage:
                    'The Server have failed to get stations data. Please refresh the page',
                buttonLabel: 'Refresh',
                onRetry: () {
                  getStationList();
                },
              );
            }
            return null;
          }),
    );
  }
}
