import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/theme/ev_design_system.dart';
import '../../../../bookmark/presentation/logic/get_bookmark_list_provider.dart';
import '../../../../sign_in/presentation/logic/logic.dart';
import '../../../data/models/bookmark_input_model.dart';
import '../../logic/logic.dart';
import 'station_detail_loading_view.dart';

class StationDetailHeaderWidget extends ConsumerStatefulWidget {
  const StationDetailHeaderWidget({
    super.key,
    required this.onPressedBackButton,
    required this.stationId,
  });

  final String stationId;
  final VoidCallback onPressedBackButton;

  @override
  StationDetailHeaderWidgetState createState() =>
      StationDetailHeaderWidgetState();
}

class StationDetailHeaderWidgetState
    extends ConsumerState<StationDetailHeaderWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStationDetailData();
      getBookmarkList();
    });
    super.initState();
  }

  void getStationDetailData() {
    ref
        .read(stationDetailProvider.notifier)
        .getStationDetail(stationId: widget.stationId);
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

  @override
  Widget build(BuildContext context) {
    final stationDetailState = ref.watch(stationDetailProvider);
    final bookmarkState = ref.watch(getBookmarkListProvider);
    final userContext = ref.watch(userContextProvider);

    return stationDetailState.whenOrNull(
          data: (stationDetail) {
            final bookmarks = bookmarkState.whenOrNull(
                  data: (bookmarks) => bookmarks,
                ) ??
                [];

            final bookmark = bookmarks
                    .where((bookmark) => bookmark.stationId == widget.stationId)
                    .isNotEmpty
                ? bookmarks.firstWhere(
                    (bookmark) => bookmark.stationId == widget.stationId)
                : null;

            final isSaved = bookmark != null;

            return Column(
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
                            Text(
                              stationDetail.stationName ?? '',
                              style: EVDesignSystem.textStyles.headline2,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                stationDetail.address ?? '',
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
                              ? Image.asset(
                                  "assets/images/heart_filledout.png",
                                  scale: 6.0,
                                )
                              : Image.asset("assets/images/heart_outline.png",
                                  scale: 6.0),
                          onPressed: () async {
                            if (isSaved) {
                              await ref
                                  .read(deleteBookmarkProvider.notifier)
                                  .deleteBookmark(
                                      bookmarkId: bookmark.bookmarkId);
                            } else {
                              if (userContext == null) return;
                              await ref
                                  .read(saveBookmarkProvider.notifier)
                                  .saveBookmark(
                                      bookmarkInput: BookmarkInputModel(
                                          userId: userContext.userId,
                                          stationId: widget.stationId));
                            }
                            getBookmarkList();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 35, right: 40),
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
                                    stationDetail.avergeRating ?? 0.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 25,
                                itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 0.005),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (_) {},
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(${stationDetail.rateCount.toString()})',
                                style: EVDesignSystem.textStyles.normal3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Image.asset(
                                  "assets/images/distance_icon.png",
                                  scale: 6.0,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //TODO add distance from google api
                              Text('5.57 km',
                                  style:
                                      EVDesignSystem.textStyles.description1),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plug_availability.png",
                                scale: 4.5,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${stationDetail.availablePort.toString()} port available',
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
                            onTap: () {},
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
                                    style:
                                        EVDesignSystem.textStyles.description1),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                                      style: EVDesignSystem
                                          .textStyles.description1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Plug LIST'),
              ],
            );
          },
          loading: () => const StationDetailLoadingView(),
        ) ??
        const SizedBox.shrink();
  }
}
