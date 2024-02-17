// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Categorys _$CategorysFromJson(Map<String, dynamic> json) {
  return _Categorys.fromJson(json);
}

/// @nodoc
mixin _$Categorys {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorysCopyWith<Categorys> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorysCopyWith<$Res> {
  factory $CategorysCopyWith(Categorys value, $Res Function(Categorys) then) =
      _$CategorysCopyWithImpl<$Res, Categorys>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? code,
      String? nameEn,
      String? nameAr,
      int? order,
      String? avatar,
      bool? active,
      @JsonKey(defaultValue: []) List<SubCategory>? subCategories});
}

/// @nodoc
class _$CategorysCopyWithImpl<$Res, $Val extends Categorys>
    implements $CategorysCopyWith<$Res> {
  _$CategorysCopyWithImpl(this._value, this._then);

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
    Object? order = freezed,
    Object? avatar = freezed,
    Object? active = freezed,
    Object? subCategories = freezed,
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
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      subCategories: freezed == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategorysCopyWith<$Res> implements $CategorysCopyWith<$Res> {
  factory _$$_CategorysCopyWith(
          _$_Categorys value, $Res Function(_$_Categorys) then) =
      __$$_CategorysCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? code,
      String? nameEn,
      String? nameAr,
      int? order,
      String? avatar,
      bool? active,
      @JsonKey(defaultValue: []) List<SubCategory>? subCategories});
}

/// @nodoc
class __$$_CategorysCopyWithImpl<$Res>
    extends _$CategorysCopyWithImpl<$Res, _$_Categorys>
    implements _$$_CategorysCopyWith<$Res> {
  __$$_CategorysCopyWithImpl(
      _$_Categorys _value, $Res Function(_$_Categorys) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? order = freezed,
    Object? avatar = freezed,
    Object? active = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$_Categorys(
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
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Categorys implements _Categorys {
  const _$_Categorys(
      {@JsonKey(name: "_id") this.id,
      this.code,
      this.nameEn,
      this.nameAr,
      this.order,
      this.avatar,
      this.active,
      @JsonKey(defaultValue: []) final List<SubCategory>? subCategories})
      : _subCategories = subCategories;

  factory _$_Categorys.fromJson(Map<String, dynamic> json) =>
      _$$_CategorysFromJson(json);

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
  final int? order;
  @override
  final String? avatar;
  @override
  final bool? active;
  final List<SubCategory>? _subCategories;
  @override
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Categorys(id: $id, code: $code, nameEn: $nameEn, nameAr: $nameAr, order: $order, avatar: $avatar, active: $active, subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Categorys &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, nameEn, nameAr, order,
      avatar, active, const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategorysCopyWith<_$_Categorys> get copyWith =>
      __$$_CategorysCopyWithImpl<_$_Categorys>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategorysToJson(
      this,
    );
  }
}

abstract class _Categorys implements Categorys {
  const factory _Categorys(
          {@JsonKey(name: "_id") final String? id,
          final String? code,
          final String? nameEn,
          final String? nameAr,
          final int? order,
          final String? avatar,
          final bool? active,
          @JsonKey(defaultValue: []) final List<SubCategory>? subCategories}) =
      _$_Categorys;

  factory _Categorys.fromJson(Map<String, dynamic> json) =
      _$_Categorys.fromJson;

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
  int? get order;
  @override
  String? get avatar;
  @override
  bool? get active;
  @override
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategorysCopyWith<_$_Categorys> get copyWith =>
      throw _privateConstructorUsedError;
}
