import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_settings_module/domain/entity/models/type.dart';

part 'shipping_input.freezed.dart';
part 'shipping_input.g.dart';

@Freezed()
class ShippingInput with _$ShippingInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory ShippingInput({
    final String? firstName,
    final String? lastName,
    final String? phone,
    final String? email,
    final String? address,
    final String? pincode,
    final String? note,
    final Type? type,
    final String? house,
    final String? street,
    final String? post,
    final String? district,
    final String? state,
    final String? landmark,
    final double? lat,
    final double? lng,
    final bool? isDefault,
    final String? mapLocation,
    final String? zone,
    final String? neighborhoodname,
    final String? flatno,
    final String? floorno
  }) = _ShippingInput;

  factory ShippingInput.fromJson(Map<String, dynamic> json) =>
      _$ShippingInputFromJson(json);
}
