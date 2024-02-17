// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_return_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderReturnFilter _$$_OrderReturnFilterFromJson(Map<String, dynamic> json) =>
    _$_OrderReturnFilter(
      status: json['status'] as String?,
      regionFilter: json['regionFilter'] as String?,
      searchKey: json['searchKey'] as String?,
      returnDate: json['returnDate'] as String?,
      invoiceDate: json['invoiceDate'] as String?,
    );

Map<String, dynamic> _$$_OrderReturnFilterToJson(
    _$_OrderReturnFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('regionFilter', instance.regionFilter);
  writeNotNull('searchKey', instance.searchKey);
  writeNotNull('returnDate', instance.returnDate);
  writeNotNull('invoiceDate', instance.invoiceDate);
  return val;
}
