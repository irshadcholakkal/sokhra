import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiereorganics_app/user_module/data/entity/input_models/days.dart';

part 'zones.freezed.dart';
part 'zones.g.dart';

@freezed
abstract class Zones with _$Zones {
    @JsonSerializable(explicitToJson: true, includeIfNull: false)

   factory Zones({
     @JsonKey(name: '_id') final String? id,
    final String? zoneName,
    final String? zoneNameAr,
    final String? zoneNameFr,
    final List<String>? pincodes,
    final bool? isActive,
    @JsonValue([]) final List<Days>? deliveryDays,
    final double? deliveryCharge,
    final double? minimumPurchaseAmount,
   }) = _Zones;
   factory Zones.fromJson(Map<String, dynamic> json) => _$ZonesFromJson(json);
}