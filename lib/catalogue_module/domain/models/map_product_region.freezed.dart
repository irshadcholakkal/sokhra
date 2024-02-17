// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_product_region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapProductRegion _$MapProductRegionFromJson(Map<String, dynamic> json) {
  return _MapProductRegion.fromJson(json);
}

/// @nodoc
mixin _$MapProductRegion {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Region? get region => throw _privateConstructorUsedError;
  bool? get featured => throw _privateConstructorUsedError;
  bool? get hasOffer => throw _privateConstructorUsedError;
  List<MapProductVariant>? get variants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapProductRegionCopyWith<MapProductRegion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapProductRegionCopyWith<$Res> {
  factory $MapProductRegionCopyWith(
          MapProductRegion value, $Res Function(MapProductRegion) then) =
      _$MapProductRegionCopyWithImpl<$Res, MapProductRegion>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      String? status,
      Region? region,
      bool? featured,
      bool? hasOffer,
      List<MapProductVariant>? variants});

  $ProductCopyWith<$Res>? get product;
  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class _$MapProductRegionCopyWithImpl<$Res, $Val extends MapProductRegion>
    implements $MapProductRegionCopyWith<$Res> {
  _$MapProductRegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? status = freezed,
    Object? region = freezed,
    Object? featured = freezed,
    Object? hasOffer = freezed,
    Object? variants = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Region?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasOffer: freezed == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool?,
      variants: freezed == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<MapProductVariant>?,
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
  $RegionCopyWith<$Res>? get region {
    if (_value.region == null) {
      return null;
    }

    return $RegionCopyWith<$Res>(_value.region!, (value) {
      return _then(_value.copyWith(region: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapProductRegionCopyWith<$Res>
    implements $MapProductRegionCopyWith<$Res> {
  factory _$$_MapProductRegionCopyWith(
          _$_MapProductRegion value, $Res Function(_$_MapProductRegion) then) =
      __$$_MapProductRegionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      String? status,
      Region? region,
      bool? featured,
      bool? hasOffer,
      List<MapProductVariant>? variants});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class __$$_MapProductRegionCopyWithImpl<$Res>
    extends _$MapProductRegionCopyWithImpl<$Res, _$_MapProductRegion>
    implements _$$_MapProductRegionCopyWith<$Res> {
  __$$_MapProductRegionCopyWithImpl(
      _$_MapProductRegion _value, $Res Function(_$_MapProductRegion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? status = freezed,
    Object? region = freezed,
    Object? featured = freezed,
    Object? hasOffer = freezed,
    Object? variants = freezed,
  }) {
    return _then(_$_MapProductRegion(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Region?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasOffer: freezed == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<MapProductVariant>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_MapProductRegion implements _MapProductRegion {
  const _$_MapProductRegion(
      {@JsonKey(name: "_id") this.id,
      this.product,
      this.status,
      this.region,
      this.featured,
      this.hasOffer,
      final List<MapProductVariant>? variants})
      : _variants = variants;

  factory _$_MapProductRegion.fromJson(Map<String, dynamic> json) =>
      _$$_MapProductRegionFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final Product? product;
  @override
  final String? status;
  @override
  final Region? region;
  @override
  final bool? featured;
  @override
  final bool? hasOffer;
  final List<MapProductVariant>? _variants;
  @override
  List<MapProductVariant>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MapProductRegion(id: $id, product: $product, status: $status, region: $region, featured: $featured, hasOffer: $hasOffer, variants: $variants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapProductRegion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.hasOffer, hasOffer) ||
                other.hasOffer == hasOffer) &&
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, status, region,
      featured, hasOffer, const DeepCollectionEquality().hash(_variants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapProductRegionCopyWith<_$_MapProductRegion> get copyWith =>
      __$$_MapProductRegionCopyWithImpl<_$_MapProductRegion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapProductRegionToJson(
      this,
    );
  }
}

abstract class _MapProductRegion implements MapProductRegion {
  const factory _MapProductRegion(
      {@JsonKey(name: "_id") final String? id,
      final Product? product,
      final String? status,
      final Region? region,
      final bool? featured,
      final bool? hasOffer,
      final List<MapProductVariant>? variants}) = _$_MapProductRegion;

  factory _MapProductRegion.fromJson(Map<String, dynamic> json) =
      _$_MapProductRegion.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  Product? get product;
  @override
  String? get status;
  @override
  Region? get region;
  @override
  bool? get featured;
  @override
  bool? get hasOffer;
  @override
  List<MapProductVariant>? get variants;
  @override
  @JsonKey(ignore: true)
  _$$_MapProductRegionCopyWith<_$_MapProductRegion> get copyWith =>
      throw _privateConstructorUsedError;
}
