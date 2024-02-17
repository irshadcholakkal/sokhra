// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return _Banner.fromJson(json);
}

/// @nodoc
mixin _$Banner {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get subHeader => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerCopyWith<Banner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerCopyWith<$Res> {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) then) =
      _$BannerCopyWithImpl<$Res, Banner>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? subHeader,
      String? type,
      String? avatar,
      int? sortOrder,
      bool? isActive});
}

/// @nodoc
class _$BannerCopyWithImpl<$Res, $Val extends Banner>
    implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subHeader = freezed,
    Object? type = freezed,
    Object? avatar = freezed,
    Object? sortOrder = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subHeader: freezed == subHeader
          ? _value.subHeader
          : subHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannerCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$$_BannerCopyWith(_$_Banner value, $Res Function(_$_Banner) then) =
      __$$_BannerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? subHeader,
      String? type,
      String? avatar,
      int? sortOrder,
      bool? isActive});
}

/// @nodoc
class __$$_BannerCopyWithImpl<$Res>
    extends _$BannerCopyWithImpl<$Res, _$_Banner>
    implements _$$_BannerCopyWith<$Res> {
  __$$_BannerCopyWithImpl(_$_Banner _value, $Res Function(_$_Banner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subHeader = freezed,
    Object? type = freezed,
    Object? avatar = freezed,
    Object? sortOrder = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Banner(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subHeader: freezed == subHeader
          ? _value.subHeader
          : subHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Banner implements _Banner {
  const _$_Banner(
      {@JsonKey(name: "_id") this.id,
      this.name,
      this.subHeader,
      this.type,
      this.avatar,
      this.sortOrder,
      this.isActive});

  factory _$_Banner.fromJson(Map<String, dynamic> json) =>
      _$$_BannerFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final String? subHeader;
  @override
  final String? type;
  @override
  final String? avatar;
  @override
  final int? sortOrder;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'Banner(id: $id, name: $name, subHeader: $subHeader, type: $type, avatar: $avatar, sortOrder: $sortOrder, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Banner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subHeader, subHeader) ||
                other.subHeader == subHeader) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, subHeader, type, avatar, sortOrder, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerCopyWith<_$_Banner> get copyWith =>
      __$$_BannerCopyWithImpl<_$_Banner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannerToJson(
      this,
    );
  }
}

abstract class _Banner implements Banner {
  const factory _Banner(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final String? subHeader,
      final String? type,
      final String? avatar,
      final int? sortOrder,
      final bool? isActive}) = _$_Banner;

  factory _Banner.fromJson(Map<String, dynamic> json) = _$_Banner.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  String? get subHeader;
  @override
  String? get type;
  @override
  String? get avatar;
  @override
  int? get sortOrder;
  @override
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_BannerCopyWith<_$_Banner> get copyWith =>
      throw _privateConstructorUsedError;
}
