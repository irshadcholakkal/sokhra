// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShippingDetails _$$_ShippingDetailsFromJson(Map<String, dynamic> json) =>
    _$_ShippingDetails(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      house: json['house'] as String?,
      type: json['type'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      email: json['email'] as String?,
      pincode: json['pincode'] as String?,
      street: json['street'] as String?,
      landmark: json['landmark'] as String?,
      note: json['note'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
    );

Map<String, dynamic> _$$_ShippingDetailsToJson(_$_ShippingDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('phone', instance.phone);
  writeNotNull('house', instance.house);
  writeNotNull('type', instance.type);
  writeNotNull('district', instance.district);
  writeNotNull('state', instance.state);
  writeNotNull('email', instance.email);
  writeNotNull('pincode', instance.pincode);
  writeNotNull('street', instance.street);
  writeNotNull('landmark', instance.landmark);
  writeNotNull('note', instance.note);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  return val;
}
