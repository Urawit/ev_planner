import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logic/station_detail/station_detail.dart';
import 'widgets/station_detail/station_detail_body_widget.dart';

class StationDetailPage extends ConsumerStatefulWidget {
  const StationDetailPage({
    required this.stationId,
    super.key,
  });

  final String stationId;

  @override
  StationDetailPageState createState() => StationDetailPageState();
}

class StationDetailPageState extends ConsumerState<StationDetailPage> {
  BitmapDescriptor? customIcon;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStationDetail();
      _loadCustomIcon();
    });
    super.initState();
  }

  void getStationDetail() {
    ref
        .read(stationDetailProvider.notifier)
        .getStationDetail(stationId: widget.stationId);
  }

  Future<void> _loadCustomIcon() async {
    final BitmapDescriptor icon = await _getCustomIcon();
    setState(() {
      customIcon = icon;
    });
  }

  Future<BitmapDescriptor> _getCustomIcon({int width = 35}) async {
    final ByteData data =
        await rootBundle.load('assets/images/default_evolt_node_icon.png');
    final Uint8List originalBytes = data.buffer.asUint8List();

    final ui.Codec codec =
        await ui.instantiateImageCodec(originalBytes, targetWidth: width);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(resizedData!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    final stationDetailState = ref.watch(stationDetailProvider);

    return stationDetailState.when(
      data: (stationDetail) => Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 80,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(
              height: 180,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng((stationDetail.lat ?? 0) + 0.00015,
                      stationDetail.long ?? 0),
                  zoom: 18.0,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId(widget.stationId),
                      position: LatLng(
                          stationDetail.lat ?? 0, stationDetail.long ?? 0),
                      icon: customIcon ?? BitmapDescriptor.defaultMarker),
                },
                scrollGesturesEnabled: false,
                zoomGesturesEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            StationDetailBodyWidget(
              stationDetail: stationDetail,
              onPressedBackButton: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error) =>
          const Center(child: Text("Error loading station details")),
    );
  }
}
