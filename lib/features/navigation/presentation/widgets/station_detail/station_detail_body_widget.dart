import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/theme/ev_design_system.dart';
import '../../../../bookmark/presentation/logic/get_bookmark_list_provider.dart';
import '../../../../sign_in/presentation/logic/logic.dart';
import '../../../data/models/bookmark_input_model.dart';
import '../../../domain/entities/station_entity.dart';
import '../../logic/logic.dart';
import 'plug_list_widget.dart';

class StationDetailBodyWidget extends ConsumerStatefulWidget {
  const StationDetailBodyWidget({
    super.key,
    required this.onPressedBackButton,
    required this.stationDetail,
  });

  final StationEntity stationDetail;
  final VoidCallback onPressedBackButton;

  @override
  StationDetailBodyWidgetState createState() => StationDetailBodyWidgetState();
}

class StationDetailBodyWidgetState
    extends ConsumerState<StationDetailBodyWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBookmarkList();
    });
    super.initState();
  }

  void getBookmarkList() {
    final userContext = ref.read(userContextProvider);
    if (userContext == null) return;

    ref
        .read(getBookmarkListProvider.notifier)
        .getBookmarkList(userId: userContext.userId);
  }

  Future<void> openEvoltApp() async {
    const evoltAppPackage = "th.evolt.echarge";
    const evoltPlayStoreUrl =
        "https://play.google.com/store/apps/details?id=$evoltAppPackage";

    final Uri evoltAppUri =
        Uri.parse("intent://#Intent;package=$evoltAppPackage;end;");

    if (await canLaunchUrl(evoltAppUri)) {
      await launchUrl(evoltAppUri);
    } else {
      await launchUrl(Uri.parse(evoltPlayStoreUrl),
          mode: LaunchMode.externalApplication);
    }
  }

  Future<void> openGoogleMaps() async {
    final double latitude = widget.stationDetail.lat ?? 0;
    final double longitude = widget.stationDetail.long ?? 0;
    final Uri googleMapsUri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch Google Maps";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkState = ref.watch(getBookmarkListProvider);
    final userContext = ref.watch(userContextProvider);

    final bookmarks = bookmarkState.whenOrNull(
          data: (bookmarks) => bookmarks,
        ) ??
        [];

    final bookmark = bookmarks
            .where((bookmark) =>
                bookmark.stationId == widget.stationDetail.stationId)
            .isNotEmpty
        ? bookmarks.firstWhere(
            (bookmark) => bookmark.stationId == widget.stationDetail.stationId)
        : null;

    final isSaved = bookmarks.isNotEmpty ? true : false;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: widget.onPressedBackButton,
                  padding: const EdgeInsets.only(bottom: 20),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.stationDetail.stationName ?? '',
                          style: EVDesignSystem.textStyles.headline2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.stationDetail.address ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: EVDesignSystem.textStyles.normal3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: IconButton(
                    icon: isSaved
                        ? Image.asset("assets/images/heart_filledout.png",
                            scale: 6.0)
                        : Image.asset("assets/images/heart_outline.png",
                            scale: 6.0),
                    onPressed: () async {
                      if (isSaved) {
                        await ref
                            .read(deleteBookmarkProvider.notifier)
                            .deleteBookmark(
                                bookmarkId: bookmark?.bookmarkId ?? '');
                      } else {
                        if (userContext == null) return;
                        await ref
                            .read(saveBookmarkProvider.notifier)
                            .saveBookmark(
                                bookmarkInput: BookmarkInputModel(
                                    userId: userContext.userId,
                                    stationId: widget.stationDetail.stationId));
                      }
                      getBookmarkList();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 35, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating:
                              widget.stationDetail.averageRating ?? 0.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0.005),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (_) {},
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '(${widget.stationDetail.rateCount})',
                          style: EVDesignSystem.textStyles.normal3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Image.asset("assets/images/distance_icon.png",
                              scale: 6.0),
                        ),
                        const SizedBox(width: 15),
                        Text('5.57 km',
                            style: EVDesignSystem.textStyles.description1),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/plug_availability.png",
                            scale: 4.5),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.stationDetail.availablePort} ports available',
                          style: EVDesignSystem.textStyles.description2,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push('/review', extra: widget.stationDetail);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/review_entry_icon.png",
                            scale: 5.0,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text('Review',
                              style: EVDesignSystem.textStyles.description1),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () {
                          openEvoltApp();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/default_evolt_node_icon.png",
                              scale: 6.0,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text('Evolt',
                                style: EVDesignSystem.textStyles.description1),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          openGoogleMaps();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/google_map_icon.png",
                              scale: 4.5,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text('Map',
                                style: EVDesignSystem.textStyles.description1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          PlugListWidget(stationDetail: widget.stationDetail),
        ],
      ),
    );
  }
}
