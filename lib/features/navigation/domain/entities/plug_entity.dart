abstract class PlugEntity {
  const PlugEntity({
    required this.plugId,
    required this.status,
    required this.plugType,
    required this.price,
    required this.maxKwh,
  });
  final String plugId;
  final String status;
  final String plugType;
  final String price;
  final String maxKwh;
}
