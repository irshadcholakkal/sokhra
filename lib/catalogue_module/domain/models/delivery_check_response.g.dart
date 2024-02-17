// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_check_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryCheckResponse _$$_DeliveryCheckResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryCheckResponse(
      zoneName: json['zoneName'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      deliveryDay: json['deliveryDay'] as String?,
      hasSameDayDelivery: json['hasSameDayDelivery'] as bool?,
      hasSameDayShipping: json['hasSameDayShipping'] as bool?,
      minimumPurchaseAmount:
          (json['minimumPurchaseAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_DeliveryCheckResponseToJson(
        _$_DeliveryCheckResponse instance) =>
    <String, dynamic>{
      'zoneName': instance.zoneName,
      'deliveryDate': instance.deliveryDate,
      'deliveryDay': instance.deliveryDay,
      'hasSameDayDelivery': instance.hasSameDayDelivery,
      'hasSameDayShipping': instance.hasSameDayShipping,
      'minimumPurchaseAmount': instance.minimumPurchaseAmount,
    };
