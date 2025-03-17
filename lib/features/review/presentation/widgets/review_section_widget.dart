import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../shared/theme/ev_design_system.dart';
import '../../../../shared/widgets/error_popup_widget.dart';
import '../../../../shared/widgets/flushbar_widget.dart';
import '../../../navigation/domain/entities/station_entity.dart';
import '../../../navigation/presentation/logic/logic.dart';
import '../../../sign_in/presentation/logic/logic.dart';
import '../../data/models/post_review_input_model.dart';
import '../logic/logic.dart';

class ReviewSectionWidget extends ConsumerStatefulWidget {
  const ReviewSectionWidget({super.key, required this.stationDetail});

  final StationEntity stationDetail;

  @override
  ReviewSectionWidgetState createState() => ReviewSectionWidgetState();
}

class ReviewSectionWidgetState extends ConsumerState<ReviewSectionWidget> {
  final TextEditingController _commentController = TextEditingController();
  bool isInputNotNull = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStationDetail();
    });
    _commentController.addListener(_checkInputNull);
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void getStationDetail() {
    ref
        .read(stationDetailProvider.notifier)
        .getStationDetail(stationId: widget.stationDetail.stationId);
  }

  void deleteReview(String reviewId) {
    ref.read(deleteReviewProvider.notifier).deleteReview(reviewId: reviewId);
  }

  void postReview(String stationId, String userId, String comment) {
    ref.read(postReviewProvider.notifier).postReview(
        postReviewInput: PostReviewInputModel(
            stationId: stationId, userId: userId, comment: comment));
  }

  void _checkInputNull() {
    setState(() {
      isInputNotNull = _commentController.text.trim().isNotEmpty;
    });
  }

  void listener() {
    ref.listen(deleteReviewProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          context.pop();
          getStationDetail();
          showFlushbar(
            context: context,
            title: 'Delete Review Successful',
            message: 'Your review has been successfully deleted.',
            backgroundColor: Colors.green,
          );
        },
        error: (_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Delete review have failed, Please retry again',
            buttonLabel: 'retry',
          );
        },
      );
    });

    ref.listen(postReviewProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          getStationDetail();
          showFlushbar(
            context: context,
            title: 'Post Review Successful',
            message: 'Your review has been successfully posted.',
            backgroundColor: Colors.green,
          );
        },
        error: (_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Post review have failed, Please retry again',
            buttonLabel: 'retry',
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final userContext = ref.watch(userContextProvider);
    final stationDetailState = ref.watch(stationDetailProvider);

    listener();

    return stationDetailState.when(
      data: (stationDetail) {
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
                  if (stationDetail.reviewList?.isNotEmpty ?? false)
                    Text(
                      "${stationDetail.reviewList?.length} comments",
                      style: EVDesignSystem.textStyles.normal2,
                    )
                ],
              ),
            ),
            if (stationDetail.reviewList?.isNotEmpty ?? false)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stationDetail.reviewList?.length,
                itemBuilder: (context, index) {
                  final review = stationDetail.reviewList?[index];

                  DateTime createdAt = DateTime.parse(review?.createDate ?? '');
                  String timeAgo =
                      timeago.format(createdAt, locale: 'en_short');

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/images/Avatar.png")
                                      as ImageProvider,
                              //TODO ADD PROFILE IMAGE
                              // backgroundImage: review.profileImageUrl != null
                              //     ? NetworkImage(review.profileImageUrl!)
                              //     : const AssetImage("assets/images/default_profile.png") as ImageProvider,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                review?.username ?? '',
                                style: EVDesignSystem.textStyles.headline4,
                              ),
                            ),
                            if (userContext?.userId == review?.userId)
                              IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                    ),
                                    builder: (context) {
                                      return Wrap(
                                        children: [
                                          ListTile(
                                              leading: const Icon(Icons.edit,
                                                  color: Colors.blue),
                                              title: const Text("Edit"),
                                              onTap: () => context.push(
                                                  '/edit-review/${review?.reviewId}?previousComment=${review?.comment}&stationId=${review?.stationId}')),
                                          ListTile(
                                            leading: const Icon(Icons.delete,
                                                color: Colors.red),
                                            title: const Text("Delete"),
                                            onTap: () => deleteReview(
                                                review?.reviewId ?? ''),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            review?.comment ?? '',
                            style: EVDesignSystem.textStyles.normal2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 6),
                          child: Text(
                            timeAgo,
                            style: EVDesignSystem.textStyles.normal3
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
                child: Text("No reviews yet.",
                    style: TextStyle(color: Colors.grey)),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => isInputNotNull
                        ? postReview(stationDetail.stationId,
                            userContext?.userId ?? '', _commentController.text)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: EVDesignSystem.colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Get review list has failed. Please retry again',
            buttonLabel: 'Retry',
            onRetry: () {
              getStationDetail();
              context.pop();
            },
          );
        });

        return const SizedBox.shrink();
      },
    );
  }
}
