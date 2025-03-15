import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/ev_design_system.dart';
import '../../../navigation/domain/entities/station_entity.dart';

class ReviewSectionWidget extends ConsumerStatefulWidget {
  const ReviewSectionWidget({super.key, required this.stationDetail});

  final StationEntity stationDetail;

  @override
  ReviewSectionWidgetState createState() => ReviewSectionWidgetState();
}

class ReviewSectionWidgetState extends ConsumerState<ReviewSectionWidget> {
  @override
  Widget build(BuildContext context) {
    final reviewList = widget.stationDetail.reviewList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Review Section",
                style: EVDesignSystem.textStyles.headline4,
              ),
              if (reviewList?.isNotEmpty ?? false)
                Text(
                  "${widget.stationDetail.reviewList?.length} comments",
                  style: EVDesignSystem.textStyles.normal2,
                )
            ],
          ),
        ),
        if (reviewList != null && reviewList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviewList.length,
            itemBuilder: (context, index) {
              final review = reviewList[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture + Username + Menu Button
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/images/avatar.png")
                                  as ImageProvider,
                          //TODO ADD PROFILE IMAGE
                          // backgroundImage: review.profileImageUrl != null
                          //     ? NetworkImage(review.profileImageUrl!)
                          //     : const AssetImage("assets/images/default_profile.png") as ImageProvider,
                        ),
                        const SizedBox(width: 10),

                        // Username
                        Expanded(
                          child: Text(
                            'review.username',
                            style: EVDesignSystem.textStyles.headline4,
                          ),
                        ),

                        // Three-dot Menu Button (Optional Actions)
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            // Handle menu action
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Comment Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        review.comment,
                        style: EVDesignSystem.textStyles.normal2,
                      ),
                    ),

                    // Date Outside the Box (Lower Left)
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 6),
                      child: Text(
                        review
                            .createDate, // Assuming this is a formatted date string
                        style: EVDesignSystem.textStyles.normal2
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        else
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Text("No reviews yet.", style: TextStyle(color: Colors.grey)),
          ),
      ],
    );
  }
}
