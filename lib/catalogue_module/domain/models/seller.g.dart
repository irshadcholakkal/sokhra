// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seller _$$_SellerFromJson(Map<String, dynamic> json) => _$_Seller(
      id: json['_id'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactEmail: json['contactEmail'] as String?,
      ibanId: json['ibanId'] as String?,
      commission: json['commission'] as int?,
      commissionType:
          $enumDecodeNullable(_$CommissionTypeEnumMap, json['commissionType']),
      order: json['order'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      subscribedUsers: (json['subscribedUsers'] as List<dynamic>?)
          ?.map((e) => SubscribedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SellerToJson(_$_Seller instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('descriptionEn', instance.descriptionEn);
  writeNotNull('descriptionAr', instance.descriptionAr);
  writeNotNull('contactPerson', instance.contactPerson);
  writeNotNull('contactEmail', instance.contactEmail);
  writeNotNull('ibanId', instance.ibanId);
  writeNotNull('commission', instance.commission);
  writeNotNull(
      'commissionType', _$CommissionTypeEnumMap[instance.commissionType]);
  writeNotNull('order', instance.order);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('subscribedUsers',
      instance.subscribedUsers?.map((e) => e.toJson()).toList());
  return val;
}

const _$CommissionTypeEnumMap = {
  CommissionType.FIXED: 'FIXED',
  CommissionType.PERCENTAGE: 'PERCENTAGE',
};
