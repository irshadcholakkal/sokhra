// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WishList _$WishListFromJson(Map<String, dynamic> json) {
  return _WishList.fromJson(json);
}

/// @nodoc
mixin _$WishList {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  Variant? get variant => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishListCopyWith<WishList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListCopyWith<$Res> {
  factory $WishListCopyWith(WishList value, $Res Function(WishList) then) =
      _$WishListCopyWithImpl<$Res, WishList>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      Variant? variant,
      User? user,
      String? deviceId});

  $ProductCopyWith<$Res>? get product;
  $VariantCopyWith<$Res>? get variant;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$WishListCopyWithImpl<$Res, $Val extends WishList>
    implements $WishListCopyWith<$Res> {
  _$WishListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? variant = freezed,
    Object? user = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VariantCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $VariantCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WishListCopyWith<$Res> implements $WishListCopyWith<$Res> {
  factory _$$_WishListCopyWith(
          _$_WishList value, $Res Function(_$_WishList) then) =
      __$$_WishListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      Variant? variant,
      User? user,
      String? deviceId});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $VariantCopyWith<$Res>? get variant;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_WishListCopyWithImpl<$Res>
    extends _$WishListCopyWithImpl<$Res, _$_WishList>
    implements _$$_WishListCopyWith<$Res> {
  __$$_WishListCopyWithImpl(
      _$_WishList _value, $Res Function(_$_WishList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? variant = freezed,
    Object? user = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$_WishList(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_WishList implements _WishList {
  const _$_WishList(
      {@JsonKey(name: "_id") this.id,
      this.product,
      this.variant,
      this.user,
      this.deviceId});

  factory _$_WishList.fromJson(Map<String, dynamic> json) =>
      _$$_WishListFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final Product? product;
  @override
  final Variant? variant;
  @override
  final User? user;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'WishList(id: $id, product: $product, variant: $variant, user: $user, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, variant, user, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishListCopyWith<_$_WishList> get copyWith =>
      __$$_WishListCopyWithImpl<_$_WishList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishListToJson(
      this,
    );
  }
}

abstract class _WishList implements WishList {
  const factory _WishList(
      {@JsonKey(name: "_id") final String? id,
      final Product? product,
      final Variant? variant,
      final User? user,
      final String? deviceId}) = _$_WishList;

  factory _WishList.fromJson(Map<String, dynamic> json) = _$_WishList.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  Product? get product;
  @override
  Variant? get variant;
  @override
  User? get user;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_WishListCopyWith<_$_WishList> get copyWith =>
      throw _privateConstructorUsedError;
}
