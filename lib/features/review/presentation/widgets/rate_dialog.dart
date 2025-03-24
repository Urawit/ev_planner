import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../navigation/domain/entities/station_entity.dart';
import '../../../navigation/presentation/logic/station_detail/station_detail_provider.dart';
import '../../data/models/rate_input_model.dart';
import '../logic/logic.dart';

final ratingProvider = StateProvider<double>((ref) => 0.0);

Future<void> showRateDialog(BuildContext context, StationEntity stationDetail,
    String userId, WidgetRef ref) {
  final hasRating =
      stationDetail.ratingList?.any((rating) => rating.userId == userId) ??
          false;

  final double initialRating = hasRating
      ? double.parse(
          stationDetail.ratingList!
              .firstWhere((rating) => rating.userId == userId)
              .rating,
        )
      : 0.0;

  ref.read(ratingProvider.notifier).state = initialRating;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 38, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Rate this station',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: initialRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      ref.read(ratingProvider.notifier).state = rating;
                    },
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      if (initialRating < 1) {
                        rate(ref, stationDetail.stationId, userId);
                      } else {
                        editRate(ref, stationDetail.stationId, userId);
                      }
                      context.pop();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(stationDetailProvider.notifier)
                            .getStationDetail(
                                stationId: stationDetail.stationId);
                      });

                      showFlushbar(
                        context: context,
                        title: 'Rating Successful',
                        message: 'Your rating has been successfully updated.',
                        backgroundColor: Colors.green,
                      );
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      );
    },
  );
}

void rate(WidgetRef ref, String stationId, String userId) {
  final rating = ref.read(ratingProvider);
  ref.read(rateProvider.notifier).rate(
      rateInput:
          RateInputModel(stationId: stationId, userId: userId, rating: rating));
}

void editRate(WidgetRef ref, String stationId, String userId) {
  final rating = ref.read(ratingProvider);
  ref.read(editRateProvider.notifier).editRate(
      rateInput:
          RateInputModel(stationId: stationId, userId: userId, rating: rating));
}
