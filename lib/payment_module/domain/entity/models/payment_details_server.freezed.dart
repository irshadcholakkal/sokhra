// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentDetailsServer _$PaymentDetailsServerFromJson(Map<String, dynamic> json) {
  return _PaymentDetailsServer.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetailsServer {
  String? get chargeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsServerCopyWith<PaymentDetailsServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsServerCopyWith<$Res> {
  factory $PaymentDetailsServerCopyWith(PaymentDetailsServer value,
          $Res Function(PaymentDetailsServer) then) =
      _$PaymentDetailsServerCopyWithImpl<$Res, PaymentDetailsServer>;
  @useResult
  $Res call({String? chargeId});
}

/// @nodoc
class _$PaymentDetailsServerCopyWithImpl<$Res,
        $Val extends PaymentDetailsServer>
    implements $PaymentDetailsServerCopyWith<$Res> {
  _$PaymentDetailsServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chargeId = freezed,
  }) {
    return _then(_value.copyWith(
      chargeId: freezed == chargeId
          ? _value.chargeId
          : chargeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsServerCopyWith<$Res>
    implements $PaymentDetailsServerCopyWith<$Res> {
  factory _$$_PaymentDetailsServerCopyWith(_$_PaymentDetailsServer value,
          $Res Function(_$_PaymentDetailsServer) then) =
      __$$_PaymentDetailsServerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? chargeId});
}

/// @nodoc
class __$$_PaymentDetailsServerCopyWithImpl<$Res>
    extends _$PaymentDetailsServerCopyWithImpl<$Res, _$_PaymentDetailsServer>
    implements _$$_PaymentDetailsServerCopyWith<$Res> {
  __$$_PaymentDetailsServerCopyWithImpl(_$_PaymentDetailsServer _value,
      $Res Function(_$_PaymentDetailsServer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chargeId = freezed,
  }) {
    return _then(_$_PaymentDetailsServer(
      chargeId: freezed == chargeId
          ? _value.chargeId
          : chargeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_PaymentDetailsServer implements _PaymentDetailsServer {
  const _$_PaymentDetailsServer({this.chargeId});

  factory _$_PaymentDetailsServer.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsServerFromJson(json);

  @override
  final String? chargeId;

  @override
  String toString() {
    return 'PaymentDetailsServer(chargeId: $chargeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetailsServer &&
            (identical(other.chargeId, chargeId) ||
                other.chargeId == chargeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chargeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsServerCopyWith<_$_PaymentDetailsServer> get copyWith =>
      __$$_PaymentDetailsServerCopyWithImpl<_$_PaymentDetailsServer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsServerToJson(
      this,
    );
  }
}

abstract class _PaymentDetailsServer implements PaymentDetailsServer {
  const factory _PaymentDetailsServer({final String? chargeId}) =
      _$_PaymentDetailsServer;

  factory _PaymentDetailsServer.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetailsServer.fromJson;

  @override
  String? get chargeId;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsServerCopyWith<_$_PaymentDetailsServer> get copyWith =>
      throw _privateConstructorUsedError;
}
