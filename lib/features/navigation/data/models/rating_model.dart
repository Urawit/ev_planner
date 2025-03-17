import '../../domain/entities/rating_entity.dart';

class RatingModel implements RatingEntity {
  const RatingModel({
    required this.ratingId,
    required this.rating,
    required this.userId,
  });
  @override
  final String ratingId;
  @override
  final String rating;
  @override
  final String userId;
}
