import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/models/map_location.dart';

part 'address_input.freezed.dart';
part 'address_input.g.dart';

@freezed
class AddressInput with _$AddressInput {
  // @JsonKey(toJson: _areaToJson)
  // final AreaInfo? area;
  // @JsonKey(toJson: _zoneToJson)
  // final ZoneInfo? zone;

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory AddressInput({
    final String? building,
    final String? street,
    final String? landMark,
    final MapLocation? mapLocation,
    final String? type,
  }) = _AddressInput;

  //INFO: Extra to conversion
  // Address toAddress() {
  //   return Address(
  //     // area: area,
  //     // zone: zone,
  //     //  building: building,
  //     street: street,
  //     landmark: landMark,
  //     // mapLocation: mapLocation,
  //     type: type,
  //   );
  // }

  // static String? _areaToJson(AreaInfo? area) => area?.id;
  //
  // static String? _zoneToJson(ZoneInfo? zone) => zone?.id;

  factory AddressInput.fromJson(Map<String, dynamic> json) =>
      _$AddressInputFromJson(json);
}
