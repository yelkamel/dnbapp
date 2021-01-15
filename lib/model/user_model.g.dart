// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String,
    level: json['level'] as String,
    name: json['name'] as String,
    pp: json['pp'] as String,
    email: json['email'] as String,
    badge: json['badge'] == null
        ? null
        : BadgeModel.fromJson(json['badge'] as Map<String, dynamic>),
    createdDate: dateTimefromJson(json['createdDate'] as Timestamp),
    nbpost: json['nbpost'] as int,
    xp: json['xp'] as int,
    tresor: (json['tresor'] as List)?.map((e) => e as String)?.toList(),
    postIds: (json['postIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'name': instance.name,
      'pp': instance.pp,
      'email': instance.email,
      'createdDate': dateTimetoJson(instance.createdDate),
      'nbpost': instance.nbpost,
      'xp': instance.xp,
      'badge': instance.badge?.toJson(),
      'tresor': instance.tresor,
      'postIds': instance.postIds,
    };
