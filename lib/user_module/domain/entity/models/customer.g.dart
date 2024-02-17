// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Customer _$$_CustomerFromJson(Map<String, dynamic> json) => _$_Customer(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      customerId: json['customerId'] as String?,
      discountCode: json['discountCode'] as String?,
      creditEnabled: json['creditEnabled'] as bool?,
      creditLimit: (json['creditLimit'] as num?)?.toDouble(),
      addressDetails: (json['addressDetails'] as List<dynamic>?)
          ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CustomerToJson(_$_Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('customerId', instance.customerId);
  writeNotNull('discountCode', instance.discountCode);
  writeNotNull('creditEnabled', instance.creditEnabled);
  writeNotNull('creditLimit', instance.creditLimit);
  writeNotNull('addressDetails',
      instance.addressDetails?.map((e) => e.toJson()).toList());
  return val;
}
