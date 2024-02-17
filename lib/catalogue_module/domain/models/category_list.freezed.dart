// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return _CategoryList.fromJson(json);
}

/// @nodoc
mixin _$CategoryList {
  List<Categorys>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryListCopyWith<CategoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListCopyWith<$Res> {
  factory $CategoryListCopyWith(
          CategoryList value, $Res Function(CategoryList) then) =
      _$CategoryListCopyWithImpl<$Res, CategoryList>;
  @useResult
  $Res call({List<Categorys>? categories});
}

/// @nodoc
class _$CategoryListCopyWithImpl<$Res, $Val extends CategoryList>
    implements $CategoryListCopyWith<$Res> {
  _$CategoryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryListCopyWith<$Res>
    implements $CategoryListCopyWith<$Res> {
  factory _$$_CategoryListCopyWith(
          _$_CategoryList value, $Res Function(_$_CategoryList) then) =
      __$$_CategoryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Categorys>? categories});
}

/// @nodoc
class __$$_CategoryListCopyWithImpl<$Res>
    extends _$CategoryListCopyWithImpl<$Res, _$_CategoryList>
    implements _$$_CategoryListCopyWith<$Res> {
  __$$_CategoryListCopyWithImpl(
      _$_CategoryList _value, $Res Function(_$_CategoryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_CategoryList(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_CategoryList implements _CategoryList {
  const _$_CategoryList({final List<Categorys>? categories})
      : _categories = categories;

  factory _$_CategoryList.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryListFromJson(json);

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
  String toString() {
    return 'CategoryList(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryList &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryListCopyWith<_$_CategoryList> get copyWith =>
      __$$_CategoryListCopyWithImpl<_$_CategoryList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryListToJson(
      this,
    );
  }
}

abstract class _CategoryList implements CategoryList {
  const factory _CategoryList({final List<Categorys>? categories}) =
      _$_CategoryList;

  factory _CategoryList.fromJson(Map<String, dynamic> json) =
      _$_CategoryList.fromJson;

  @override
  List<Categorys>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryListCopyWith<_$_CategoryList> get copyWith =>
      throw _privateConstructorUsedError;
}
