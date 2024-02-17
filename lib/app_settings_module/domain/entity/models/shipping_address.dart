import 'package:freezed_annotation/freezed_annotation.dart';

import 'type.dart';

part 'shipping_address.freezed.dart';
part 'shipping_address.g.dart';

@freezed
class ShippingAddress with _$ShippingAddress {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory ShippingAddress({
    @JsonKey(name: '_id') final String? id,
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
    final bool? isDefault,
    final String? landmark,
    final String? lat,
    final String? lng,
    final String? zone,
    final String? neighborhoodname,
    final String? flatno,
    final String? floorno

    
  }) = _ShippingAddress;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
}
  

