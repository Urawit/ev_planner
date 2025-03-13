import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../shared/theme/ev_design_system.dart';
import '../../../../sign_in/presentation/logic/logic.dart';
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
      ref
          .read(stationDetailProvider.notifier)
          .getStationDetail(stationId: widget.stationId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stationDetailState = ref.watch(stationDetailProvider);
    final userContext = ref.watch(userContextProvider);

    return stationDetailState.whenOrNull(
          data: (stationDetail) {
            final isBookmarked = userContext?.bookmarkList
                .any((bookmark) => bookmark.stationId == widget.stationId);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
                      const SizedBox(width: 35),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: IconButton(
                          icon: Icon(
                            isBookmarked ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isBookmarked ?? false
                                ? Colors.orange
                                : Colors.grey,
                          ),
                          onPressed: () {
                            // ref
                            //     .read(savedStationsProvider.notifier)
                            //     .toggleSaved(widget.stationId);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 22.0, left: 27, right: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
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
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(37)',
                                style: EVDesignSystem.textStyles.normal3,
                              ),
                            ],
                          ),
                          Text('distance'),
                          Text('port availability'),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Review')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Evolt')),
                        ],
                      ),
                    ],
                  ),
                ),
                Text('PORT LIST'),
              ],
            );
          },
          loading: () => const StationDetailLoadingView(),
        ) ??
        const SizedBox.shrink();
  }
}
