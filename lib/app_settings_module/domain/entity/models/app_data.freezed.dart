// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppData _$AppDataFromJson(Map<String, dynamic> json) {
  return _AppData.fromJson(json);
}

/// @nodoc
mixin _$AppData {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ShippingAddress>? get addressDetails =>
      throw _privateConstructorUsedError;
  String? get discountCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataCopyWith<AppData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) then) =
      _$AppDataCopyWithImpl<$Res, AppData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      @JsonKey(defaultValue: []) List<ShippingAddress>? addressDetails,
      String? discountCode});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res, $Val extends AppData>
    implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? addressDetails = freezed,
    Object? discountCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>?,
      discountCode: freezed == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppDataCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$$_AppDataCopyWith(
          _$_AppData value, $Res Function(_$_AppData) then) =
      __$$_AppDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      @JsonKey(defaultValue: []) List<ShippingAddress>? addressDetails,
      String? discountCode});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_AppDataCopyWithImpl<$Res>
    extends _$AppDataCopyWithImpl<$Res, _$_AppData>
    implements _$$_AppDataCopyWith<$Res> {
  __$$_AppDataCopyWithImpl(_$_AppData _value, $Res Function(_$_AppData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? addressDetails = freezed,
    Object? discountCode = freezed,
  }) {
    return _then(_$_AppData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      addressDetails: freezed == addressDetails
          ? _value._addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>?,
      discountCode: freezed == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_AppData implements _AppData {
  const _$_AppData(
      {@JsonKey(name: "_id") this.id,
      this.user,
      @JsonKey(defaultValue: []) final List<ShippingAddress>? addressDetails,
      this.discountCode})
      : _addressDetails = addressDetails;

  factory _$_AppData.fromJson(Map<String, dynamic> json) =>
      _$$_AppDataFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final User? user;
  final List<ShippingAddress>? _addressDetails;
  @override
  @JsonKey(defaultValue: [])
  List<ShippingAddress>? get addressDetails {
    final value = _addressDetails;
    if (value == null) return null;
    if (_addressDetails is EqualUnmodifiableListView) return _addressDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? discountCode;

  @override
  String toString() {
    return 'AppData(id: $id, user: $user, addressDetails: $addressDetails, discountCode: $discountCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._addressDetails, _addressDetails) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user,
      const DeepCollectionEquality().hash(_addressDetails), discountCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppDataCopyWith<_$_AppData> get copyWith =>
      __$$_AppDataCopyWithImpl<_$_AppData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppDataToJson(
      this,
    );
  }
}

abstract class _AppData implements AppData {
  const factory _AppData(
      {@JsonKey(name: "_id") final String? id,
      final User? user,
      @JsonKey(defaultValue: []) final List<ShippingAddress>? addressDetails,
      final String? discountCode}) = _$_AppData;

  factory _AppData.fromJson(Map<String, dynamic> json) = _$_AppData.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  User? get user;
  @override
  @JsonKey(defaultValue: [])
  List<ShippingAddress>? get addressDetails;
  @override
  String? get discountCode;
  @override
  @JsonKey(ignore: true)
  _$$_AppDataCopyWith<_$_AppData> get copyWith =>
      throw _privateConstructorUsedError;
}
