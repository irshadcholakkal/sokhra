// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistory _$$_OrderHistoryFromJson(Map<String, dynamic> json) =>
    _$_OrderHistory(
      createdAt: json['createdAt'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_OrderHistoryToJson(_$_OrderHistory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('note', instance.note);
  return val;
}
