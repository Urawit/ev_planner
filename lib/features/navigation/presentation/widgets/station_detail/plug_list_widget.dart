import 'package:ev_planner/shared/theme/ev_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/station_entity.dart';

class PlugListWidget extends ConsumerStatefulWidget {
  final StationEntity stationDetail;

  const PlugListWidget({super.key, required this.stationDetail});

  @override
  PlugListWidgetState createState() => PlugListWidgetState();
}

class PlugListWidgetState extends ConsumerState<PlugListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: EVDesignSystem.colors.grey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 240.0, top: 20),
            child: Text(
              'Port List',
              style: EVDesignSystem.textStyles.headline4,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.stationDetail.plugList?.map((plug) {
                  final isUnavailableOrOutOfService =
                      plug.status == 'unavailable' ||
                          plug.status == 'outofservice';

                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    color: isUnavailableOrOutOfService
                        ? Colors.grey[500]
                        : Colors.white,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      // TODO IMPLEMENT ONTAP PLUG
                      onTap: isUnavailableOrOutOfService
                          ? null
                          : () {
                              // Add logic for onTap if needed
                            },
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                                color: Colors.transparent,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                '${(int.tryParse(plug.plugId) ?? 0) + 135697}',
                                style: EVDesignSystem.textStyles
                                    .headline3, // Or any text style you want
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Image.asset("assets/images/plug_icon.png",
                                  scale: 4.5),
                              const SizedBox(width: 8),
                              Text(
                                '${(double.tryParse(plug.maxKwh)?.toStringAsFixed(0) ?? plug.maxKwh)} kW',
                                style: EVDesignSystem.textStyles.headline3,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('${plug.price} B / kWh + ${plug.price} B / hour',
                              style: const TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                  );
                }).toList() ??
                [],
          ),
          (widget.stationDetail.plugList?.length ?? 0) < 4
              ? const SizedBox(height: 200)
              : const SizedBox(height: 10),
        ],
      ),
    );
  }
}
