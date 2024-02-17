import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user_module/domain/entity/models/user.dart';
import 'shipping_address.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory AppData({
    @JsonKey(name: "_id") final String? id,
    final User? user,
    @JsonKey(defaultValue: []) final List<ShippingAddress>? addressDetails,
    final String? discountCode,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
}
