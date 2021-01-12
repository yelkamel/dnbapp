// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    id: json['id'] as String,
    name: json['name'] as String,
    createdDate: dateTimefromJson(json['createdDate'] as Timestamp),
    user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    type: json['type'] as String,
    views: json['views'] as int,
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': dateTimetoJson(instance.createdDate),
      'user': instance.user.toJson(),
      'type': instance.type,
      'views': instance.views,
    };
