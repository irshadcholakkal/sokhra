// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_return_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderReturnFilter _$OrderReturnFilterFromJson(Map<String, dynamic> json) {
  return _OrderReturnFilter.fromJson(json);
}

/// @nodoc
mixin _$OrderReturnFilter {
  String? get status => throw _privateConstructorUsedError;
  String? get regionFilter => throw _privateConstructorUsedError;
  String? get searchKey => throw _privateConstructorUsedError;
  String? get returnDate => throw _privateConstructorUsedError;
  String? get invoiceDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderReturnFilterCopyWith<OrderReturnFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderReturnFilterCopyWith<$Res> {
  factory $OrderReturnFilterCopyWith(
          OrderReturnFilter value, $Res Function(OrderReturnFilter) then) =
      _$OrderReturnFilterCopyWithImpl<$Res, OrderReturnFilter>;
  @useResult
  $Res call(
      {String? status,
      String? regionFilter,
      String? searchKey,
      String? returnDate,
      String? invoiceDate});
}

/// @nodoc
class _$OrderReturnFilterCopyWithImpl<$Res, $Val extends OrderReturnFilter>
    implements $OrderReturnFilterCopyWith<$Res> {
  _$OrderReturnFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? regionFilter = freezed,
    Object? searchKey = freezed,
    Object? returnDate = freezed,
    Object? invoiceDate = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      regionFilter: freezed == regionFilter
          ? _value.regionFilter
          : regionFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderReturnFilterCopyWith<$Res>
    implements $OrderReturnFilterCopyWith<$Res> {
  factory _$$_OrderReturnFilterCopyWith(_$_OrderReturnFilter value,
          $Res Function(_$_OrderReturnFilter) then) =
      __$$_OrderReturnFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      String? regionFilter,
      String? searchKey,
      String? returnDate,
      String? invoiceDate});
}

/// @nodoc
class __$$_OrderReturnFilterCopyWithImpl<$Res>
    extends _$OrderReturnFilterCopyWithImpl<$Res, _$_OrderReturnFilter>
    implements _$$_OrderReturnFilterCopyWith<$Res> {
  __$$_OrderReturnFilterCopyWithImpl(
      _$_OrderReturnFilter _value, $Res Function(_$_OrderReturnFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? regionFilter = freezed,
    Object? searchKey = freezed,
    Object? returnDate = freezed,
    Object? invoiceDate = freezed,
  }) {
    return _then(_$_OrderReturnFilter(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      regionFilter: freezed == regionFilter
          ? _value.regionFilter
          : regionFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OrderReturnFilter implements _OrderReturnFilter {
  const _$_OrderReturnFilter(
      {this.status,
      this.regionFilter,
      this.searchKey,
      this.returnDate,
      this.invoiceDate});

  factory _$_OrderReturnFilter.fromJson(Map<String, dynamic> json) =>
      _$$_OrderReturnFilterFromJson(json);

  @override
  final String? status;
  @override
  final String? regionFilter;
  @override
  final String? searchKey;
  @override
  final String? returnDate;
  @override
  final String? invoiceDate;

  @override
  String toString() {
    return 'OrderReturnFilter(status: $status, regionFilter: $regionFilter, searchKey: $searchKey, returnDate: $returnDate, invoiceDate: $invoiceDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderReturnFilter &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.regionFilter, regionFilter) ||
                other.regionFilter == regionFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, regionFilter, searchKey, returnDate, invoiceDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderReturnFilterCopyWith<_$_OrderReturnFilter> get copyWith =>
      __$$_OrderReturnFilterCopyWithImpl<_$_OrderReturnFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderReturnFilterToJson(
      this,
    );
  }
}

abstract class _OrderReturnFilter implements OrderReturnFilter {
  const factory _OrderReturnFilter(
      {final String? status,
      final String? regionFilter,
      final String? searchKey,
      final String? returnDate,
      final String? invoiceDate}) = _$_OrderReturnFilter;

  factory _OrderReturnFilter.fromJson(Map<String, dynamic> json) =
      _$_OrderReturnFilter.fromJson;

  @override
  String? get status;
  @override
  String? get regionFilter;
  @override
  String? get searchKey;
  @override
  String? get returnDate;
  @override
  String? get invoiceDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderReturnFilterCopyWith<_$_OrderReturnFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
