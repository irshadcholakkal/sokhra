// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubChoice _$$_SubChoiceFromJson(Map<String, dynamic> json) => _$_SubChoice(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      choicePrice: (json['choicePrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SubChoiceToJson(_$_SubChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('choicePrice', instance.choicePrice);
  return val;
}
