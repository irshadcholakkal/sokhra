import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone.freezed.dart';
part 'zone.g.dart';

enum Days { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday }

@freezed
class Zone with _$Zone {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Zone({
    @JsonKey(name: "_id") final String? zoneId,
    final String? zoneName,
    final List<String>? pincodes,
    final bool? isActive,
    @JsonValue([]) final List<Days>? deliveryDays,
    final double? deliveryCharge,
    final double? minimumPurchaseAmount,
  }) = _Zone;

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}
