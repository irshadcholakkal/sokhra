// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_payment_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InitiatePaymentInput _$$_InitiatePaymentInputFromJson(
        Map<String, dynamic> json) =>
    _$_InitiatePaymentInput(
      addressId: json['addressId'] as String?,
      deviceId: json['deviceId'] as String?,
      note: json['note'] as String?,
      paymentType: $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
      invoiceAmount: (json['invoiceAmount'] as num).toDouble(),
      promoDiscount: (json['promoDiscount'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
      deliveryDate: json['deliveryDate'] as String?,
      deliveryShift: json['deliveryShift'] as String?,
      applyWallet: json['applyWallet'] as bool? ?? false,
      promoCode: json['promoCode'] as String?,
    );

Map<String, dynamic> _$$_InitiatePaymentInputToJson(
    _$_InitiatePaymentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressId', instance.addressId);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('note', instance.note);
  val['paymentType'] = _$PaymentTypeEnumMap[instance.paymentType]!;
  val['invoiceAmount'] = instance.invoiceAmount;
  val['promoDiscount'] = instance.promoDiscount;
  val['subTotal'] = instance.subTotal;
  writeNotNull('deliveryDate', instance.deliveryDate);
  writeNotNull('deliveryShift', instance.deliveryShift);
  val['applyWallet'] = instance.applyWallet;
  writeNotNull('promoCode', instance.promoCode);
  return val;
}

const _$PaymentTypeEnumMap = {
  PaymentType.PAYMENT_GATEWAY: 'PAYMENT_GATEWAY',
  PaymentType.WALLET: 'WALLET',
  PaymentType.COD: 'COD',
};
