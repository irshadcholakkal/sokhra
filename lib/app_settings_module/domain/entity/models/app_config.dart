import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  // final PaymentConfig? paymentConfig,
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory AppConfig({
    final String? privacyPolicyEn,
    final String? privacyPolicyAr,
    final String? termsAndConditionsEn,
    final String? termsAndConditionsAr,
    @JsonKey(name: 'chargeForCustomerOrder')
        final double? customerDeliveryCharge,
    @JsonKey(name: 'chargeForVendorOrder') final double? vendorDeliveryCharge,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
