// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopModel _$TopModelFromJson(Map<String, dynamic> json) {
  return TopModel(
    id: json['id'] as String,
    uid: json['uid'] as String,
    user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    posts: (json['posts'] as List)
        .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    updatedDate: dateTimefromJson(json['updatedDate'] as Timestamp),
  );
}

Map<String, dynamic> _$TopModelToJson(TopModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'user': instance.user.toJson(),
      'updatedDate': dateTimetoJson(instance.updatedDate),
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
