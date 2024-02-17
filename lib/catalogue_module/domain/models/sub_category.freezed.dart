// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return _SubCategory.fromJson(json);
}

/// @nodoc
mixin _$SubCategory {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  Categorys? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryCopyWith<SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryCopyWith<$Res> {
  factory $SubCategoryCopyWith(
          SubCategory value, $Res Function(SubCategory) then) =
      _$SubCategoryCopyWithImpl<$Res, SubCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? code,
      String? nameEn,
      String? nameAr,
      String? avatar,
      int? order,
      Categorys? category});

  $CategorysCopyWith<$Res>? get category;
}

/// @nodoc
class _$SubCategoryCopyWithImpl<$Res, $Val extends SubCategory>
    implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? avatar = freezed,
    Object? order = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Categorys?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategorysCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategorysCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubCategoryCopyWith<$Res>
    implements $SubCategoryCopyWith<$Res> {
  factory _$$_SubCategoryCopyWith(
          _$_SubCategory value, $Res Function(_$_SubCategory) then) =
      __$$_SubCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? code,
      String? nameEn,
      String? nameAr,
      String? avatar,
      int? order,
      Categorys? category});

  @override
  $CategorysCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_SubCategoryCopyWithImpl<$Res>
    extends _$SubCategoryCopyWithImpl<$Res, _$_SubCategory>
    implements _$$_SubCategoryCopyWith<$Res> {
  __$$_SubCategoryCopyWithImpl(
      _$_SubCategory _value, $Res Function(_$_SubCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? avatar = freezed,
    Object? order = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_SubCategory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Categorys?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_SubCategory implements _SubCategory {
  const _$_SubCategory(
      {@JsonKey(name: "_id") this.id,
      this.code,
      this.nameEn,
      this.nameAr,
      this.avatar,
      this.order,
      this.category});

  factory _$_SubCategory.fromJson(Map<String, dynamic> json) =>
      _$$_SubCategoryFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? code;
  @override
  final String? nameEn;
  @override
  final String? nameAr;
  @override
  final String? avatar;
  @override
  final int? order;
  @override
  final Categorys? category;

  @override
  String toString() {
    return 'SubCategory(id: $id, code: $code, nameEn: $nameEn, nameAr: $nameAr, avatar: $avatar, order: $order, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, nameEn, nameAr, avatar, order, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubCategoryCopyWith<_$_SubCategory> get copyWith =>
      __$$_SubCategoryCopyWithImpl<_$_SubCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubCategoryToJson(
      this,
    );
  }
}

abstract class _SubCategory implements SubCategory {
  const factory _SubCategory(
      {@JsonKey(name: "_id") final String? id,
      final String? code,
      final String? nameEn,
      final String? nameAr,
      final String? avatar,
      final int? order,
      final Categorys? category}) = _$_SubCategory;

  factory _SubCategory.fromJson(Map<String, dynamic> json) =
      _$_SubCategory.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get code;
  @override
  String? get nameEn;
  @override
  String? get nameAr;
  @override
  String? get avatar;
  @override
  int? get order;
  @override
  Categorys? get category;
  @override
  @JsonKey(ignore: true)
  _$$_SubCategoryCopyWith<_$_SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
