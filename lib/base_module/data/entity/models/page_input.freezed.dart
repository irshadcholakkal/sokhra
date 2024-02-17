// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageInput _$PageInputFromJson(Map<String, dynamic> json) {
  return _PageInput.fromJson(json);
}

/// @nodoc
mixin _$PageInput {
  int get limit => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInputCopyWith<PageInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInputCopyWith<$Res> {
  factory $PageInputCopyWith(PageInput value, $Res Function(PageInput) then) =
      _$PageInputCopyWithImpl<$Res, PageInput>;
  @useResult
  $Res call({int limit, int skip});
}

/// @nodoc
class _$PageInputCopyWithImpl<$Res, $Val extends PageInput>
    implements $PageInputCopyWith<$Res> {
  _$PageInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? skip = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageInputCopyWith<$Res> implements $PageInputCopyWith<$Res> {
  factory _$$_PageInputCopyWith(
          _$_PageInput value, $Res Function(_$_PageInput) then) =
      __$$_PageInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int skip});
}

/// @nodoc
class __$$_PageInputCopyWithImpl<$Res>
    extends _$PageInputCopyWithImpl<$Res, _$_PageInput>
    implements _$$_PageInputCopyWith<$Res> {
  __$$_PageInputCopyWithImpl(
      _$_PageInput _value, $Res Function(_$_PageInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? skip = null,
  }) {
    return _then(_$_PageInput(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PageInput implements _PageInput {
  const _$_PageInput({this.limit = 0, this.skip = 0});

  factory _$_PageInput.fromJson(Map<String, dynamic> json) =>
      _$$_PageInputFromJson(json);

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int skip;

  @override
  String toString() {
    return 'PageInput(limit: $limit, skip: $skip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageInput &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.skip, skip) || other.skip == skip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, skip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageInputCopyWith<_$_PageInput> get copyWith =>
      __$$_PageInputCopyWithImpl<_$_PageInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageInputToJson(
      this,
    );
  }
}

abstract class _PageInput implements PageInput {
  const factory _PageInput({final int limit, final int skip}) = _$_PageInput;

  factory _PageInput.fromJson(Map<String, dynamic> json) =
      _$_PageInput.fromJson;

  @override
  int get limit;
  @override
  int get skip;
  @override
  @JsonKey(ignore: true)
  _$$_PageInputCopyWith<_$_PageInput> get copyWith =>
      throw _privateConstructorUsedError;
}
