// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
mixin _$Brand {
  @JsonKey(name: "_id")
  String? get brandId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isTrending => throw _privateConstructorUsedError;
  List<Categorys>? get categories => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? brandId,
      String? code,
      String? name,
      bool? isActive,
      bool? isTrending,
      List<Categorys>? categories,
      String? image,
      String? logo,
      int? order});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? isTrending = freezed,
    Object? categories = freezed,
    Object? image = freezed,
    Object? logo = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTrending: freezed == isTrending
          ? _value.isTrending
          : isTrending // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$_BrandCopyWith(_$_Brand value, $Res Function(_$_Brand) then) =
      __$$_BrandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? brandId,
      String? code,
      String? name,
      bool? isActive,
      bool? isTrending,
      List<Categorys>? categories,
      String? image,
      String? logo,
      int? order});
}

/// @nodoc
class __$$_BrandCopyWithImpl<$Res> extends _$BrandCopyWithImpl<$Res, _$_Brand>
    implements _$$_BrandCopyWith<$Res> {
  __$$_BrandCopyWithImpl(_$_Brand _value, $Res Function(_$_Brand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? isTrending = freezed,
    Object? categories = freezed,
    Object? image = freezed,
    Object? logo = freezed,
    Object? order = freezed,
  }) {
    return _then(_$_Brand(
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTrending: freezed == isTrending
          ? _value.isTrending
          : isTrending // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Brand implements _Brand {
  const _$_Brand(
      {@JsonKey(name: "_id") this.brandId,
      this.code,
      this.name,
      this.isActive,
      this.isTrending,
      final List<Categorys>? categories,
      this.image,
      this.logo,
      this.order})
      : _categories = categories;

  factory _$_Brand.fromJson(Map<String, dynamic> json) =>
      _$$_BrandFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? brandId;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final bool? isActive;
  @override
  final bool? isTrending;
  final List<Categorys>? _categories;
  @override
  List<Categorys>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? image;
  @override
  final String? logo;
  @override
  final int? order;

  @override
  String toString() {
    return 'Brand(brandId: $brandId, code: $code, name: $name, isActive: $isActive, isTrending: $isTrending, categories: $categories, image: $image, logo: $logo, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Brand &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isTrending, isTrending) ||
                other.isTrending == isTrending) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      brandId,
      code,
      name,
      isActive,
      isTrending,
      const DeepCollectionEquality().hash(_categories),
      image,
      logo,
      order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      __$$_BrandCopyWithImpl<_$_Brand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandToJson(
      this,
    );
  }
}

abstract class _Brand implements Brand {
  const factory _Brand(
      {@JsonKey(name: "_id") final String? brandId,
      final String? code,
      final String? name,
      final bool? isActive,
      final bool? isTrending,
      final List<Categorys>? categories,
      final String? image,
      final String? logo,
      final int? order}) = _$_Brand;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$_Brand.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get brandId;
  @override
  String? get code;
  @override
  String? get name;
  @override
  bool? get isActive;
  @override
  bool? get isTrending;
  @override
  List<Categorys>? get categories;
  @override
  String? get image;
  @override
  String? get logo;
  @override
  int? get order;
  @override
  @JsonKey(ignore: true)
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      throw _privateConstructorUsedError;
}
