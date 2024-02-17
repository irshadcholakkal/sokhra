// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_choices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubChoice _$SubChoiceFromJson(Map<String, dynamic> json) {
  return _SubChoice.fromJson(json);
}

/// @nodoc
mixin _$SubChoice {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get choicePrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubChoiceCopyWith<SubChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubChoiceCopyWith<$Res> {
  factory $SubChoiceCopyWith(SubChoice value, $Res Function(SubChoice) then) =
      _$SubChoiceCopyWithImpl<$Res, SubChoice>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id, String? name, double? choicePrice});
}

/// @nodoc
class _$SubChoiceCopyWithImpl<$Res, $Val extends SubChoice>
    implements $SubChoiceCopyWith<$Res> {
  _$SubChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? choicePrice = freezed,
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
      choicePrice: freezed == choicePrice
          ? _value.choicePrice
          : choicePrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubChoiceCopyWith<$Res> implements $SubChoiceCopyWith<$Res> {
  factory _$$_SubChoiceCopyWith(
          _$_SubChoice value, $Res Function(_$_SubChoice) then) =
      __$$_SubChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id, String? name, double? choicePrice});
}

/// @nodoc
class __$$_SubChoiceCopyWithImpl<$Res>
    extends _$SubChoiceCopyWithImpl<$Res, _$_SubChoice>
    implements _$$_SubChoiceCopyWith<$Res> {
  __$$_SubChoiceCopyWithImpl(
      _$_SubChoice _value, $Res Function(_$_SubChoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? choicePrice = freezed,
  }) {
    return _then(_$_SubChoice(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      choicePrice: freezed == choicePrice
          ? _value.choicePrice
          : choicePrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_SubChoice with DiagnosticableTreeMixin implements _SubChoice {
  const _$_SubChoice(
      {@JsonKey(name: "_id") this.id, this.name, this.choicePrice});

  factory _$_SubChoice.fromJson(Map<String, dynamic> json) =>
      _$$_SubChoiceFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final double? choicePrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubChoice(id: $id, name: $name, choicePrice: $choicePrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubChoice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('choicePrice', choicePrice));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubChoice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.choicePrice, choicePrice) ||
                other.choicePrice == choicePrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, choicePrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubChoiceCopyWith<_$_SubChoice> get copyWith =>
      __$$_SubChoiceCopyWithImpl<_$_SubChoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubChoiceToJson(
      this,
    );
  }
}

abstract class _SubChoice implements SubChoice {
  const factory _SubChoice(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final double? choicePrice}) = _$_SubChoice;

  factory _SubChoice.fromJson(Map<String, dynamic> json) =
      _$_SubChoice.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  double? get choicePrice;
  @override
  @JsonKey(ignore: true)
  _$$_SubChoiceCopyWith<_$_SubChoice> get copyWith =>
      throw _privateConstructorUsedError;
}
