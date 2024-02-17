// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return _Variant.fromJson(json);
}

/// @nodoc
mixin _$Variant {
  @JsonKey(name: "_id")
  String? get variantId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get minimumQuantity => throw _privateConstructorUsedError;
  int? get maximumQuantity => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get reductionPrice => throw _privateConstructorUsedError;
  String? get choiceType => throw _privateConstructorUsedError;
  List<SubChoice>? get subChoices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res, Variant>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? variantId,
      String? name,
      int? minimumQuantity,
      int? maximumQuantity,
      bool? isDefault,
      double? price,
      int? quantity,
      double? reductionPrice,
      String? choiceType,
      List<SubChoice>? subChoices});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res, $Val extends Variant>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = freezed,
    Object? name = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
    Object? isDefault = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? reductionPrice = freezed,
    Object? choiceType = freezed,
    Object? subChoices = freezed,
  }) {
    return _then(_value.copyWith(
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reductionPrice: freezed == reductionPrice
          ? _value.reductionPrice
          : reductionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      choiceType: freezed == choiceType
          ? _value.choiceType
          : choiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      subChoices: freezed == subChoices
          ? _value.subChoices
          : subChoices // ignore: cast_nullable_to_non_nullable
              as List<SubChoice>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$$_VariantCopyWith(
          _$_Variant value, $Res Function(_$_Variant) then) =
      __$$_VariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? variantId,
      String? name,
      int? minimumQuantity,
      int? maximumQuantity,
      bool? isDefault,
      double? price,
      int? quantity,
      double? reductionPrice,
      String? choiceType,
      List<SubChoice>? subChoices});
}

/// @nodoc
class __$$_VariantCopyWithImpl<$Res>
    extends _$VariantCopyWithImpl<$Res, _$_Variant>
    implements _$$_VariantCopyWith<$Res> {
  __$$_VariantCopyWithImpl(_$_Variant _value, $Res Function(_$_Variant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = freezed,
    Object? name = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
    Object? isDefault = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? reductionPrice = freezed,
    Object? choiceType = freezed,
    Object? subChoices = freezed,
  }) {
    return _then(_$_Variant(
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reductionPrice: freezed == reductionPrice
          ? _value.reductionPrice
          : reductionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      choiceType: freezed == choiceType
          ? _value.choiceType
          : choiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      subChoices: freezed == subChoices
          ? _value._subChoices
          : subChoices // ignore: cast_nullable_to_non_nullable
              as List<SubChoice>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Variant implements _Variant {
  const _$_Variant(
      {@JsonKey(name: "_id") this.variantId,
      this.name,
      this.minimumQuantity,
      this.maximumQuantity,
      this.isDefault,
      this.price,
      this.quantity,
      this.reductionPrice,
      this.choiceType,
      final List<SubChoice>? subChoices})
      : _subChoices = subChoices;

  factory _$_Variant.fromJson(Map<String, dynamic> json) =>
      _$$_VariantFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? variantId;
  @override
  final String? name;
  @override
  final int? minimumQuantity;
  @override
  final int? maximumQuantity;
  @override
  final bool? isDefault;
  @override
  final double? price;
  @override
  final int? quantity;
  @override
  final double? reductionPrice;
  @override
  final String? choiceType;
  final List<SubChoice>? _subChoices;
  @override
  List<SubChoice>? get subChoices {
    final value = _subChoices;
    if (value == null) return null;
    if (_subChoices is EqualUnmodifiableListView) return _subChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Variant(variantId: $variantId, name: $name, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, isDefault: $isDefault, price: $price, quantity: $quantity, reductionPrice: $reductionPrice, choiceType: $choiceType, subChoices: $subChoices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Variant &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reductionPrice, reductionPrice) ||
                other.reductionPrice == reductionPrice) &&
            (identical(other.choiceType, choiceType) ||
                other.choiceType == choiceType) &&
            const DeepCollectionEquality()
                .equals(other._subChoices, _subChoices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      variantId,
      name,
      minimumQuantity,
      maximumQuantity,
      isDefault,
      price,
      quantity,
      reductionPrice,
      choiceType,
      const DeepCollectionEquality().hash(_subChoices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VariantCopyWith<_$_Variant> get copyWith =>
      __$$_VariantCopyWithImpl<_$_Variant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VariantToJson(
      this,
    );
  }
}

abstract class _Variant implements Variant {
  const factory _Variant(
      {@JsonKey(name: "_id") final String? variantId,
      final String? name,
      final int? minimumQuantity,
      final int? maximumQuantity,
      final bool? isDefault,
      final double? price,
      final int? quantity,
      final double? reductionPrice,
      final String? choiceType,
      final List<SubChoice>? subChoices}) = _$_Variant;

  factory _Variant.fromJson(Map<String, dynamic> json) = _$_Variant.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get variantId;
  @override
  String? get name;
  @override
  int? get minimumQuantity;
  @override
  int? get maximumQuantity;
  @override
  bool? get isDefault;
  @override
  double? get price;
  @override
  int? get quantity;
  @override
  double? get reductionPrice;
  @override
  String? get choiceType;
  @override
  List<SubChoice>? get subChoices;
  @override
  @JsonKey(ignore: true)
  _$$_VariantCopyWith<_$_Variant> get copyWith =>
      throw _privateConstructorUsedError;
}
