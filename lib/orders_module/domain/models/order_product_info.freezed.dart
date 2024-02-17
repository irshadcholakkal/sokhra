// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_product_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderProductInfo _$OrderProductInfoFromJson(Map<String, dynamic> json) {
  return _OrderProductInfo.fromJson(json);
}

/// @nodoc
mixin _$OrderProductInfo {
  String? get thumbnailImage => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get variant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductInfoCopyWith<OrderProductInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductInfoCopyWith<$Res> {
  factory $OrderProductInfoCopyWith(
          OrderProductInfo value, $Res Function(OrderProductInfo) then) =
      _$OrderProductInfoCopyWithImpl<$Res, OrderProductInfo>;
  @useResult
  $Res call({String? thumbnailImage, String? name, String? variant});
}

/// @nodoc
class _$OrderProductInfoCopyWithImpl<$Res, $Val extends OrderProductInfo>
    implements $OrderProductInfoCopyWith<$Res> {
  _$OrderProductInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnailImage = freezed,
    Object? name = freezed,
    Object? variant = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderProductInfoCopyWith<$Res>
    implements $OrderProductInfoCopyWith<$Res> {
  factory _$$_OrderProductInfoCopyWith(
          _$_OrderProductInfo value, $Res Function(_$_OrderProductInfo) then) =
      __$$_OrderProductInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? thumbnailImage, String? name, String? variant});
}

/// @nodoc
class __$$_OrderProductInfoCopyWithImpl<$Res>
    extends _$OrderProductInfoCopyWithImpl<$Res, _$_OrderProductInfo>
    implements _$$_OrderProductInfoCopyWith<$Res> {
  __$$_OrderProductInfoCopyWithImpl(
      _$_OrderProductInfo _value, $Res Function(_$_OrderProductInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnailImage = freezed,
    Object? name = freezed,
    Object? variant = freezed,
  }) {
    return _then(_$_OrderProductInfo(
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_OrderProductInfo implements _OrderProductInfo {
  const _$_OrderProductInfo({this.thumbnailImage, this.name, this.variant});

  factory _$_OrderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OrderProductInfoFromJson(json);

  @override
  final String? thumbnailImage;
  @override
  final String? name;
  @override
  final String? variant;

  @override
  String toString() {
    return 'OrderProductInfo(thumbnailImage: $thumbnailImage, name: $name, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProductInfo &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.variant, variant) || other.variant == variant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thumbnailImage, name, variant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderProductInfoCopyWith<_$_OrderProductInfo> get copyWith =>
      __$$_OrderProductInfoCopyWithImpl<_$_OrderProductInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderProductInfoToJson(
      this,
    );
  }
}

abstract class _OrderProductInfo implements OrderProductInfo {
  const factory _OrderProductInfo(
      {final String? thumbnailImage,
      final String? name,
      final String? variant}) = _$_OrderProductInfo;

  factory _OrderProductInfo.fromJson(Map<String, dynamic> json) =
      _$_OrderProductInfo.fromJson;

  @override
  String? get thumbnailImage;
  @override
  String? get name;
  @override
  String? get variant;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductInfoCopyWith<_$_OrderProductInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
