// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemSort _$ItemSortFromJson(Map<String, dynamic> json) {
  return _ItemSort.fromJson(json);
}

/// @nodoc
mixin _$ItemSort {
  String? get nameEn => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemSortCopyWith<ItemSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSortCopyWith<$Res> {
  factory $ItemSortCopyWith(ItemSort value, $Res Function(ItemSort) then) =
      _$ItemSortCopyWithImpl<$Res, ItemSort>;
  @useResult
  $Res call({String? nameEn, String? id});
}

/// @nodoc
class _$ItemSortCopyWithImpl<$Res, $Val extends ItemSort>
    implements $ItemSortCopyWith<$Res> {
  _$ItemSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEn = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemSortCopyWith<$Res> implements $ItemSortCopyWith<$Res> {
  factory _$$_ItemSortCopyWith(
          _$_ItemSort value, $Res Function(_$_ItemSort) then) =
      __$$_ItemSortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nameEn, String? id});
}

/// @nodoc
class __$$_ItemSortCopyWithImpl<$Res>
    extends _$ItemSortCopyWithImpl<$Res, _$_ItemSort>
    implements _$$_ItemSortCopyWith<$Res> {
  __$$_ItemSortCopyWithImpl(
      _$_ItemSort _value, $Res Function(_$_ItemSort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEn = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ItemSort(
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemSort implements _ItemSort {
  _$_ItemSort({this.nameEn, this.id});

  factory _$_ItemSort.fromJson(Map<String, dynamic> json) =>
      _$$_ItemSortFromJson(json);

  @override
  final String? nameEn;
  @override
  final String? id;

  @override
  String toString() {
    return 'ItemSort(nameEn: $nameEn, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemSort &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameEn, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemSortCopyWith<_$_ItemSort> get copyWith =>
      __$$_ItemSortCopyWithImpl<_$_ItemSort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemSortToJson(
      this,
    );
  }
}

abstract class _ItemSort implements ItemSort {
  factory _ItemSort({final String? nameEn, final String? id}) = _$_ItemSort;

  factory _ItemSort.fromJson(Map<String, dynamic> json) = _$_ItemSort.fromJson;

  @override
  String? get nameEn;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ItemSortCopyWith<_$_ItemSort> get copyWith =>
      throw _privateConstructorUsedError;
}
