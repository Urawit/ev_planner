import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../navigation/domain/entities/station_entity.dart';
import '../../sign_in/presentation/logic/sign_in_provider.dart';
import 'widgets/rate_dialog.dart';
import 'widgets/review_section_widget.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({super.key, required this.stationDetail});

  final StationEntity stationDetail;

  @override
  ReviewPageState createState() => ReviewPageState();
}

class ReviewPageState extends ConsumerState<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final userContext = ref.watch(userContextProvider);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                  padding: const EdgeInsets.only(bottom: 20),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.stationDetail.stationName ?? '',
                        style: EVDesignSystem.textStyles.headline2,
                      ),
                      SizedBox(
                        width: 300,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: widget.stationDetail.averageRating ?? 0.0,
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
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEB7A29),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => showRateDialog(context,
                          widget.stationDetail, userContext?.userId ?? ''),
                      child: const Text('Rate')),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child:
                    ReviewSectionWidget(stationDetail: widget.stationDetail)),
          ),
        ],
      ),
    );
  }
}
