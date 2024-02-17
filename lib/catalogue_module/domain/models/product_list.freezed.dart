// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductList _$ProductListFromJson(Map<String, dynamic> json) {
  return _ProductList.fromJson(json);
}

/// @nodoc
mixin _$ProductList {
  @JsonKey(defaultValue: [])
  List<Product> get products => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListCopyWith<ProductList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListCopyWith<$Res> {
  factory $ProductListCopyWith(
          ProductList value, $Res Function(ProductList) then) =
      _$ProductListCopyWithImpl<$Res, ProductList>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<Product> products, int totalCount});
}

/// @nodoc
class _$ProductListCopyWithImpl<$Res, $Val extends ProductList>
    implements $ProductListCopyWith<$Res> {
  _$ProductListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductListCopyWith<$Res>
    implements $ProductListCopyWith<$Res> {
  factory _$$_ProductListCopyWith(
          _$_ProductList value, $Res Function(_$_ProductList) then) =
      __$$_ProductListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<Product> products, int totalCount});
}

/// @nodoc
class __$$_ProductListCopyWithImpl<$Res>
    extends _$ProductListCopyWithImpl<$Res, _$_ProductList>
    implements _$$_ProductListCopyWith<$Res> {
  __$$_ProductListCopyWithImpl(
      _$_ProductList _value, $Res Function(_$_ProductList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalCount = null,
  }) {
    return _then(_$_ProductList(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_ProductList implements _ProductList {
  const _$_ProductList(
      {@JsonKey(defaultValue: []) required final List<Product> products,
      required this.totalCount})
      : _products = products;

  factory _$_ProductList.fromJson(Map<String, dynamic> json) =>
      _$$_ProductListFromJson(json);

  final List<Product> _products;
  @override
  @JsonKey(defaultValue: [])
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'ProductList(products: $products, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductList &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductListCopyWith<_$_ProductList> get copyWith =>
      __$$_ProductListCopyWithImpl<_$_ProductList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductListToJson(
      this,
    );
  }
}

abstract class _ProductList implements ProductList {
  const factory _ProductList(
      {@JsonKey(defaultValue: []) required final List<Product> products,
      required final int totalCount}) = _$_ProductList;

  factory _ProductList.fromJson(Map<String, dynamic> json) =
      _$_ProductList.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<Product> get products;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_ProductListCopyWith<_$_ProductList> get copyWith =>
      throw _privateConstructorUsedError;
}
