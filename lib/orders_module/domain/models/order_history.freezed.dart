// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return _OrderHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderHistory {
  String? get createdAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call({String? createdAt, String? note});
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$_OrderHistoryCopyWith(
          _$_OrderHistory value, $Res Function(_$_OrderHistory) then) =
      __$$_OrderHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? createdAt, String? note});
}

/// @nodoc
class __$$_OrderHistoryCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$_OrderHistory>
    implements _$$_OrderHistoryCopyWith<$Res> {
  __$$_OrderHistoryCopyWithImpl(
      _$_OrderHistory _value, $Res Function(_$_OrderHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_OrderHistory(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OrderHistory implements _OrderHistory {
  const _$_OrderHistory({this.createdAt, this.note});

  factory _$_OrderHistory.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryFromJson(json);

  @override
  final String? createdAt;
  @override
  final String? note;

  @override
  String toString() {
    return 'OrderHistory(createdAt: $createdAt, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistory &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryCopyWith<_$_OrderHistory> get copyWith =>
      __$$_OrderHistoryCopyWithImpl<_$_OrderHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryToJson(
      this,
    );
  }
}

abstract class _OrderHistory implements OrderHistory {
  const factory _OrderHistory({final String? createdAt, final String? note}) =
      _$_OrderHistory;

  factory _OrderHistory.fromJson(Map<String, dynamic> json) =
      _$_OrderHistory.fromJson;

  @override
  String? get createdAt;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryCopyWith<_$_OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
