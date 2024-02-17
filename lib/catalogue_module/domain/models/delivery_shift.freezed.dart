// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryShift _$DeliveryShiftFromJson(Map<String, dynamic> json) {
  return _DeliveryShift.fromJson(json);
}

/// @nodoc
mixin _$DeliveryShift {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  bool? get isAvailableforBooking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryShiftCopyWith<DeliveryShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryShiftCopyWith<$Res> {
  factory $DeliveryShiftCopyWith(
          DeliveryShift value, $Res Function(DeliveryShift) then) =
      _$DeliveryShiftCopyWithImpl<$Res, DeliveryShift>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? startTime,
      String? endTime,
      bool? isAvailableforBooking});
}

/// @nodoc
class _$DeliveryShiftCopyWithImpl<$Res, $Val extends DeliveryShift>
    implements $DeliveryShiftCopyWith<$Res> {
  _$DeliveryShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isAvailableforBooking = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailableforBooking: freezed == isAvailableforBooking
          ? _value.isAvailableforBooking
          : isAvailableforBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryShiftCopyWith<$Res>
    implements $DeliveryShiftCopyWith<$Res> {
  factory _$$_DeliveryShiftCopyWith(
          _$_DeliveryShift value, $Res Function(_$_DeliveryShift) then) =
      __$$_DeliveryShiftCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? startTime,
      String? endTime,
      bool? isAvailableforBooking});
}

/// @nodoc
class __$$_DeliveryShiftCopyWithImpl<$Res>
    extends _$DeliveryShiftCopyWithImpl<$Res, _$_DeliveryShift>
    implements _$$_DeliveryShiftCopyWith<$Res> {
  __$$_DeliveryShiftCopyWithImpl(
      _$_DeliveryShift _value, $Res Function(_$_DeliveryShift) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isAvailableforBooking = freezed,
  }) {
    return _then(_$_DeliveryShift(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailableforBooking: freezed == isAvailableforBooking
          ? _value.isAvailableforBooking
          : isAvailableforBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_DeliveryShift implements _DeliveryShift {
  _$_DeliveryShift(
      {@JsonKey(name: '_id') this.id,
      this.startTime,
      this.endTime,
      this.isAvailableforBooking});

  factory _$_DeliveryShift.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryShiftFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final bool? isAvailableforBooking;

  @override
  String toString() {
    return 'DeliveryShift(id: $id, startTime: $startTime, endTime: $endTime, isAvailableforBooking: $isAvailableforBooking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryShift &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAvailableforBooking, isAvailableforBooking) ||
                other.isAvailableforBooking == isAvailableforBooking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startTime, endTime, isAvailableforBooking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryShiftCopyWith<_$_DeliveryShift> get copyWith =>
      __$$_DeliveryShiftCopyWithImpl<_$_DeliveryShift>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryShiftToJson(
      this,
    );
  }
}

abstract class _DeliveryShift implements DeliveryShift {
  factory _DeliveryShift(
      {@JsonKey(name: '_id') final String? id,
      final String? startTime,
      final String? endTime,
      final bool? isAvailableforBooking}) = _$_DeliveryShift;

  factory _DeliveryShift.fromJson(Map<String, dynamic> json) =
      _$_DeliveryShift.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  bool? get isAvailableforBooking;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryShiftCopyWith<_$_DeliveryShift> get copyWith =>
      throw _privateConstructorUsedError;
}
