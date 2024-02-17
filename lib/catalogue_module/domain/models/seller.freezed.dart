// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Seller _$SellerFromJson(Map<String, dynamic> json) {
  return _Seller.fromJson(json);
}

/// @nodoc
mixin _$Seller {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get descriptionEn => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  String? get contactPerson => throw _privateConstructorUsedError;
  String? get contactEmail => throw _privateConstructorUsedError;
  String? get ibanId => throw _privateConstructorUsedError;
  int? get commission => throw _privateConstructorUsedError;
  CommissionType? get commissionType => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<SubscribedUser>? get subscribedUsers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerCopyWith<Seller> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerCopyWith<$Res> {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) then) =
      _$SellerCopyWithImpl<$Res, Seller>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? descriptionEn,
      String? descriptionAr,
      String? contactPerson,
      String? contactEmail,
      String? ibanId,
      int? commission,
      CommissionType? commissionType,
      int? order,
      User? user,
      List<SubscribedUser>? subscribedUsers});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SellerCopyWithImpl<$Res, $Val extends Seller>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? contactPerson = freezed,
    Object? contactEmail = freezed,
    Object? ibanId = freezed,
    Object? commission = freezed,
    Object? commissionType = freezed,
    Object? order = freezed,
    Object? user = freezed,
    Object? subscribedUsers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: freezed == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ibanId: freezed == ibanId
          ? _value.ibanId
          : ibanId // ignore: cast_nullable_to_non_nullable
              as String?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int?,
      commissionType: freezed == commissionType
          ? _value.commissionType
          : commissionType // ignore: cast_nullable_to_non_nullable
              as CommissionType?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      subscribedUsers: freezed == subscribedUsers
          ? _value.subscribedUsers
          : subscribedUsers // ignore: cast_nullable_to_non_nullable
              as List<SubscribedUser>?,
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
abstract class _$$_SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$$_SellerCopyWith(_$_Seller value, $Res Function(_$_Seller) then) =
      __$$_SellerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? descriptionEn,
      String? descriptionAr,
      String? contactPerson,
      String? contactEmail,
      String? ibanId,
      int? commission,
      CommissionType? commissionType,
      int? order,
      User? user,
      List<SubscribedUser>? subscribedUsers});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SellerCopyWithImpl<$Res>
    extends _$SellerCopyWithImpl<$Res, _$_Seller>
    implements _$$_SellerCopyWith<$Res> {
  __$$_SellerCopyWithImpl(_$_Seller _value, $Res Function(_$_Seller) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? contactPerson = freezed,
    Object? contactEmail = freezed,
    Object? ibanId = freezed,
    Object? commission = freezed,
    Object? commissionType = freezed,
    Object? order = freezed,
    Object? user = freezed,
    Object? subscribedUsers = freezed,
  }) {
    return _then(_$_Seller(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: freezed == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ibanId: freezed == ibanId
          ? _value.ibanId
          : ibanId // ignore: cast_nullable_to_non_nullable
              as String?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int?,
      commissionType: freezed == commissionType
          ? _value.commissionType
          : commissionType // ignore: cast_nullable_to_non_nullable
              as CommissionType?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      subscribedUsers: freezed == subscribedUsers
          ? _value._subscribedUsers
          : subscribedUsers // ignore: cast_nullable_to_non_nullable
              as List<SubscribedUser>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Seller implements _Seller {
  const _$_Seller(
      {@JsonKey(name: "_id") this.id,
      this.descriptionEn,
      this.descriptionAr,
      this.contactPerson,
      this.contactEmail,
      this.ibanId,
      this.commission,
      this.commissionType,
      this.order,
      this.user,
      final List<SubscribedUser>? subscribedUsers})
      : _subscribedUsers = subscribedUsers;

  factory _$_Seller.fromJson(Map<String, dynamic> json) =>
      _$$_SellerFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? descriptionEn;
  @override
  final String? descriptionAr;
  @override
  final String? contactPerson;
  @override
  final String? contactEmail;
  @override
  final String? ibanId;
  @override
  final int? commission;
  @override
  final CommissionType? commissionType;
  @override
  final int? order;
  @override
  final User? user;
  final List<SubscribedUser>? _subscribedUsers;
  @override
  List<SubscribedUser>? get subscribedUsers {
    final value = _subscribedUsers;
    if (value == null) return null;
    if (_subscribedUsers is EqualUnmodifiableListView) return _subscribedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Seller(id: $id, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, contactPerson: $contactPerson, contactEmail: $contactEmail, ibanId: $ibanId, commission: $commission, commissionType: $commissionType, order: $order, user: $user, subscribedUsers: $subscribedUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Seller &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.ibanId, ibanId) || other.ibanId == ibanId) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.commissionType, commissionType) ||
                other.commissionType == commissionType) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._subscribedUsers, _subscribedUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      descriptionEn,
      descriptionAr,
      contactPerson,
      contactEmail,
      ibanId,
      commission,
      commissionType,
      order,
      user,
      const DeepCollectionEquality().hash(_subscribedUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      __$$_SellerCopyWithImpl<_$_Seller>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SellerToJson(
      this,
    );
  }
}

abstract class _Seller implements Seller {
  const factory _Seller(
      {@JsonKey(name: "_id") final String? id,
      final String? descriptionEn,
      final String? descriptionAr,
      final String? contactPerson,
      final String? contactEmail,
      final String? ibanId,
      final int? commission,
      final CommissionType? commissionType,
      final int? order,
      final User? user,
      final List<SubscribedUser>? subscribedUsers}) = _$_Seller;

  factory _Seller.fromJson(Map<String, dynamic> json) = _$_Seller.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get descriptionEn;
  @override
  String? get descriptionAr;
  @override
  String? get contactPerson;
  @override
  String? get contactEmail;
  @override
  String? get ibanId;
  @override
  int? get commission;
  @override
  CommissionType? get commissionType;
  @override
  int? get order;
  @override
  User? get user;
  @override
  List<SubscribedUser>? get subscribedUsers;
  @override
  @JsonKey(ignore: true)
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      throw _privateConstructorUsedError;
}
