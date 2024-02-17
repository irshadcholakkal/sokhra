// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banners.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return _Banners.fromJson(json);
}

/// @nodoc
mixin _$Banners {
  List<Banner>? get banners => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannersCopyWith<Banners> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersCopyWith<$Res> {
  factory $BannersCopyWith(Banners value, $Res Function(Banners) then) =
      _$BannersCopyWithImpl<$Res, Banners>;
  @useResult
  $Res call({List<Banner>? banners});
}

/// @nodoc
class _$BannersCopyWithImpl<$Res, $Val extends Banners>
    implements $BannersCopyWith<$Res> {
  _$BannersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = freezed,
  }) {
    return _then(_value.copyWith(
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannersCopyWith<$Res> implements $BannersCopyWith<$Res> {
  factory _$$_BannersCopyWith(
          _$_Banners value, $Res Function(_$_Banners) then) =
      __$$_BannersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Banner>? banners});
}

/// @nodoc
class __$$_BannersCopyWithImpl<$Res>
    extends _$BannersCopyWithImpl<$Res, _$_Banners>
    implements _$$_BannersCopyWith<$Res> {
  __$$_BannersCopyWithImpl(_$_Banners _value, $Res Function(_$_Banners) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = freezed,
  }) {
    return _then(_$_Banners(
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Banners implements _Banners {
  const _$_Banners({final List<Banner>? banners = const []})
      : _banners = banners;

  factory _$_Banners.fromJson(Map<String, dynamic> json) =>
      _$$_BannersFromJson(json);

  final List<Banner>? _banners;
  @override
  @JsonKey()
  List<Banner>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Banners(banners: $banners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Banners &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banners));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannersCopyWith<_$_Banners> get copyWith =>
      __$$_BannersCopyWithImpl<_$_Banners>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannersToJson(
      this,
    );
  }
}

abstract class _Banners implements Banners {
  const factory _Banners({final List<Banner>? banners}) = _$_Banners;

  factory _Banners.fromJson(Map<String, dynamic> json) = _$_Banners.fromJson;

  @override
  List<Banner>? get banners;
  @override
  @JsonKey(ignore: true)
  _$$_BannersCopyWith<_$_Banners> get copyWith =>
      throw _privateConstructorUsedError;
}
