// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) {
  return _NotificationList.fromJson(json);
}

/// @nodoc
mixin _$NotificationList {
  @JsonKey(defaultValue: [])
  List<AppNotification>? get notifications =>
      throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListCopyWith<NotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListCopyWith<$Res> {
  factory $NotificationListCopyWith(
          NotificationList value, $Res Function(NotificationList) then) =
      _$NotificationListCopyWithImpl<$Res, NotificationList>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<AppNotification>? notifications,
      int? totalCount});
}

/// @nodoc
class _$NotificationListCopyWithImpl<$Res, $Val extends NotificationList>
    implements $NotificationListCopyWith<$Res> {
  _$NotificationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<AppNotification>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationListCopyWith<$Res>
    implements $NotificationListCopyWith<$Res> {
  factory _$$_NotificationListCopyWith(
          _$_NotificationList value, $Res Function(_$_NotificationList) then) =
      __$$_NotificationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<AppNotification>? notifications,
      int? totalCount});
}

/// @nodoc
class __$$_NotificationListCopyWithImpl<$Res>
    extends _$NotificationListCopyWithImpl<$Res, _$_NotificationList>
    implements _$$_NotificationListCopyWith<$Res> {
  __$$_NotificationListCopyWithImpl(
      _$_NotificationList _value, $Res Function(_$_NotificationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_NotificationList(
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<AppNotification>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_NotificationList implements _NotificationList {
  const _$_NotificationList(
      {@JsonKey(defaultValue: [])
          required final List<AppNotification>? notifications,
      required this.totalCount})
      : _notifications = notifications;

  factory _$_NotificationList.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationListFromJson(json);

  final List<AppNotification>? _notifications;
  @override
  @JsonKey(defaultValue: [])
  List<AppNotification>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'NotificationList(notifications: $notifications, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationList &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_notifications), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationListCopyWith<_$_NotificationList> get copyWith =>
      __$$_NotificationListCopyWithImpl<_$_NotificationList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationListToJson(
      this,
    );
  }
}

abstract class _NotificationList implements NotificationList {
  const factory _NotificationList(
      {@JsonKey(defaultValue: [])
          required final List<AppNotification>? notifications,
      required final int? totalCount}) = _$_NotificationList;

  factory _NotificationList.fromJson(Map<String, dynamic> json) =
      _$_NotificationList.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<AppNotification>? get notifications;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationListCopyWith<_$_NotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}
