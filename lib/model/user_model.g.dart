// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    badgeId: json['badgeId'] as String,
    createdDate: dateTimefromJson(json['createdDate'] as Timestamp),
    saved: (json['saved'] as List)?.map((e) => e as String)?.toList(),
    posts: (json['posts'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'createdDate': dateTimetoJson(instance.createdDate),
      'saved': instance.saved,
      'posts': instance.posts,
      'badgeId': instance.badgeId,
    };
