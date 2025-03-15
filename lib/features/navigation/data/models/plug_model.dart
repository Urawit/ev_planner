import '../../domain/entities/plug_entity.dart';

class PlugModel implements PlugEntity {
  const PlugModel({
    required this.plugId,
    required this.status,
    required this.plugType,
    required this.price,
    required this.maxKwh,
  });
  @override
  final String plugId;

  @override
  final String status;

  @override
  final String plugType;

  @override
  final String price;

  @override
  final String maxKwh;
}
