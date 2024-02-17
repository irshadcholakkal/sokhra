// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_wallet_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerWalletList _$CustomerWalletListFromJson(Map<String, dynamic> json) {
  return _CustomerWalletList.fromJson(json);
}

/// @nodoc
mixin _$CustomerWalletList {
  List<CustomerWallet>? get getCustomerWallet =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerWalletListCopyWith<CustomerWalletList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerWalletListCopyWith<$Res> {
  factory $CustomerWalletListCopyWith(
          CustomerWalletList value, $Res Function(CustomerWalletList) then) =
      _$CustomerWalletListCopyWithImpl<$Res, CustomerWalletList>;
  @useResult
  $Res call({List<CustomerWallet>? getCustomerWallet});
}

/// @nodoc
class _$CustomerWalletListCopyWithImpl<$Res, $Val extends CustomerWalletList>
    implements $CustomerWalletListCopyWith<$Res> {
  _$CustomerWalletListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCustomerWallet = freezed,
  }) {
    return _then(_value.copyWith(
      getCustomerWallet: freezed == getCustomerWallet
          ? _value.getCustomerWallet
          : getCustomerWallet // ignore: cast_nullable_to_non_nullable
              as List<CustomerWallet>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerWalletListCopyWith<$Res>
    implements $CustomerWalletListCopyWith<$Res> {
  factory _$$_CustomerWalletListCopyWith(_$_CustomerWalletList value,
          $Res Function(_$_CustomerWalletList) then) =
      __$$_CustomerWalletListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerWallet>? getCustomerWallet});
}

/// @nodoc
class __$$_CustomerWalletListCopyWithImpl<$Res>
    extends _$CustomerWalletListCopyWithImpl<$Res, _$_CustomerWalletList>
    implements _$$_CustomerWalletListCopyWith<$Res> {
  __$$_CustomerWalletListCopyWithImpl(
      _$_CustomerWalletList _value, $Res Function(_$_CustomerWalletList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getCustomerWallet = freezed,
  }) {
    return _then(_$_CustomerWalletList(
      getCustomerWallet: freezed == getCustomerWallet
          ? _value._getCustomerWallet
          : getCustomerWallet // ignore: cast_nullable_to_non_nullable
              as List<CustomerWallet>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_CustomerWalletList
    with DiagnosticableTreeMixin
    implements _CustomerWalletList {
  const _$_CustomerWalletList(
      {required final List<CustomerWallet>? getCustomerWallet})
      : _getCustomerWallet = getCustomerWallet;

  factory _$_CustomerWalletList.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerWalletListFromJson(json);

  final List<CustomerWallet>? _getCustomerWallet;
  @override
  List<CustomerWallet>? get getCustomerWallet {
    final value = _getCustomerWallet;
    if (value == null) return null;
    if (_getCustomerWallet is EqualUnmodifiableListView)
      return _getCustomerWallet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomerWalletList(getCustomerWallet: $getCustomerWallet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomerWalletList'))
      ..add(DiagnosticsProperty('getCustomerWallet', getCustomerWallet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerWalletList &&
            const DeepCollectionEquality()
                .equals(other._getCustomerWallet, _getCustomerWallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_getCustomerWallet));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerWalletListCopyWith<_$_CustomerWalletList> get copyWith =>
      __$$_CustomerWalletListCopyWithImpl<_$_CustomerWalletList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerWalletListToJson(
      this,
    );
  }
}

abstract class _CustomerWalletList implements CustomerWalletList {
  const factory _CustomerWalletList(
          {required final List<CustomerWallet>? getCustomerWallet}) =
      _$_CustomerWalletList;

  factory _CustomerWalletList.fromJson(Map<String, dynamic> json) =
      _$_CustomerWalletList.fromJson;

  @override
  List<CustomerWallet>? get getCustomerWallet;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerWalletListCopyWith<_$_CustomerWalletList> get copyWith =>
      throw _privateConstructorUsedError;
}
