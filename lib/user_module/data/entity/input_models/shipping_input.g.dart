// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShippingInput _$$_ShippingInputFromJson(Map<String, dynamic> json) =>
    _$_ShippingInput(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      note: json['note'] as String?,
      type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
      house: json['house'] as String?,
      street: json['street'] as String?,
      post: json['post'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      landmark: json['landmark'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
      mapLocation: json['mapLocation'] as String?,
      zone: json['zone'] as String?,
      neighborhoodname: json['neighborhoodname'] as String?,
      flatno: json['flatno'] as String?,
      floorno: json['floorno'] as String?,
    );

Map<String, dynamic> _$$_ShippingInputToJson(_$_ShippingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('address', instance.address);
  writeNotNull('pincode', instance.pincode);
  writeNotNull('note', instance.note);
  writeNotNull('type', _$TypeEnumMap[instance.type]);
  writeNotNull('house', instance.house);
  writeNotNull('street', instance.street);
  writeNotNull('post', instance.post);
  writeNotNull('district', instance.district);
  writeNotNull('state', instance.state);
  writeNotNull('landmark', instance.landmark);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('isDefault', instance.isDefault);
  writeNotNull('mapLocation', instance.mapLocation);
  writeNotNull('zone', instance.zone);
  writeNotNull('neighborhoodname', instance.neighborhoodname);
  writeNotNull('flatno', instance.flatno);
  writeNotNull('floorno', instance.floorno);
  return val;
}

const _$TypeEnumMap = {
  Type.HOME: 'HOME',
  Type.OFFICE: 'OFFICE',
  Type.SHOP: 'SHOP',
};
