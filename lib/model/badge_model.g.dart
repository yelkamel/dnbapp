// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeModel _$BadgeModelFromJson(Map<String, dynamic> json) {
  return BadgeModel(
    id: json['id'] as String,
    name: json['name'] as String,
    color1: json['color1'] as String,
    color2: json['color2'] as String,
    color3: json['color3'] as String,
    color4: json['color4'] as String,
  );
}

Map<String, dynamic> _$BadgeModelToJson(BadgeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color1': instance.color1,
      'color2': instance.color2,
      'color3': instance.color3,
      'color4': instance.color4,
    };
