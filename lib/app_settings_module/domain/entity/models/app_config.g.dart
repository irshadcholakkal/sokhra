// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppConfig _$$_AppConfigFromJson(Map<String, dynamic> json) => _$_AppConfig(
      privacyPolicyEn: json['privacyPolicyEn'] as String?,
      privacyPolicyAr: json['privacyPolicyAr'] as String?,
      termsAndConditionsEn: json['termsAndConditionsEn'] as String?,
      termsAndConditionsAr: json['termsAndConditionsAr'] as String?,
      customerDeliveryCharge:
          (json['chargeForCustomerOrder'] as num?)?.toDouble(),
      vendorDeliveryCharge: (json['chargeForVendorOrder'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AppConfigToJson(_$_AppConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('privacyPolicyEn', instance.privacyPolicyEn);
  writeNotNull('privacyPolicyAr', instance.privacyPolicyAr);
  writeNotNull('termsAndConditionsEn', instance.termsAndConditionsEn);
  writeNotNull('termsAndConditionsAr', instance.termsAndConditionsAr);
  writeNotNull('chargeForCustomerOrder', instance.customerDeliveryCharge);
  writeNotNull('chargeForVendorOrder', instance.vendorDeliveryCharge);
  return val;
}
