// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;
  EmailToken? get emailToken =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'firebaseToken', defaultValue: [])
//     final List<String>? firebaseTokenList,
// @JsonKey(name: 'deviceId', defaultValue: [])
//     final List<String>? deviceIdList,
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      Role? role,
      Seller? seller,
      EmailToken? emailToken,
      bool? active});

  $SellerCopyWith<$Res>? get seller;
  $EmailTokenCopyWith<$Res>? get emailToken;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? seller = freezed,
    Object? emailToken = freezed,
    Object? active = freezed,
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
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      emailToken: freezed == emailToken
          ? _value.emailToken
          : emailToken // ignore: cast_nullable_to_non_nullable
              as EmailToken?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmailTokenCopyWith<$Res>? get emailToken {
    if (_value.emailToken == null) {
      return null;
    }

    return $EmailTokenCopyWith<$Res>(_value.emailToken!, (value) {
      return _then(_value.copyWith(emailToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      Role? role,
      Seller? seller,
      EmailToken? emailToken,
      bool? active});

  @override
  $SellerCopyWith<$Res>? get seller;
  @override
  $EmailTokenCopyWith<$Res>? get emailToken;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? seller = freezed,
    Object? emailToken = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      emailToken: freezed == emailToken
          ? _value.emailToken
          : emailToken // ignore: cast_nullable_to_non_nullable
              as EmailToken?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.role,
      this.seller,
      this.emailToken,
      this.active});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final Role? role;
  @override
  final Seller? seller;
  @override
  final EmailToken? emailToken;
// @JsonKey(name: 'firebaseToken', defaultValue: [])
//     final List<String>? firebaseTokenList,
// @JsonKey(name: 'deviceId', defaultValue: [])
//     final List<String>? deviceIdList,
  @override
  final bool? active;

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastname: $lastname, email: $email, phone: $phone, role: $role, seller: $seller, emailToken: $emailToken, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.emailToken, emailToken) ||
                other.emailToken == emailToken) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lastname, email, phone,
      role, seller, emailToken, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final String? lastname,
      final String? email,
      final String? phone,
      final Role? role,
      final Seller? seller,
      final EmailToken? emailToken,
      final bool? active}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  Role? get role;
  @override
  Seller? get seller;
  @override
  EmailToken? get emailToken;
  @override // @JsonKey(name: 'firebaseToken', defaultValue: [])
//     final List<String>? firebaseTokenList,
// @JsonKey(name: 'deviceId', defaultValue: [])
//     final List<String>? deviceIdList,
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
