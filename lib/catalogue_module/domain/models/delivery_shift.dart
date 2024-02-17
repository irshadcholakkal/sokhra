
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_shift.freezed.dart';
part 'delivery_shift.g.dart';

@freezed
 class DeliveryShift with _$DeliveryShift {
   @JsonSerializable(explicitToJson: true, includeIfNull: false)
   factory DeliveryShift({
    @JsonKey(name:'_id') final String? id,
    final String? startTime,
    final String? endTime,
    final bool? isAvailableforBooking,   
   }) = _DeliveryShift;

   factory DeliveryShift.fromJson(Map<String, dynamic> json) => _$DeliveryShiftFromJson(json);
}








