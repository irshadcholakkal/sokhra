// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpInput _$$_OtpInputFromJson(Map<String, dynamic> json) => _$_OtpInput(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      otpType: $enumDecode(_$OtpTypeEnumMap, json['otpType']),
    );

Map<String, dynamic> _$$_OtpInputToJson(_$_OtpInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['otpType'] = _$OtpTypeEnumMap[instance.otpType]!;
  return val;
}

const _$OtpTypeEnumMap = {
  OtpType.EMAIL: 'EMAIL',
  OtpType.PHONE: 'PHONE',
  OtpType.BOTH: 'BOTH',
};
