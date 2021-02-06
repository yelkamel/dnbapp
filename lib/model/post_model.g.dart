// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    id: json['id'] as String,
    uid: json['uid'] as String,
    name: json['name'] as String,
    createdDate: dateTimefromJson(json['createdDate'] as Timestamp),
    type: json['type'] as String,
    views: json['views'] as int,
    country: countryCodeFromJson(json['country'] as Map<String, dynamic>),
    latlng: latlngFromJson(json['latlng'] as GeoPoint),
  )
    ..producer = json['producer'] as String
    ..trackName = json['trackName'] as String;
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'producer': instance.producer,
      'trackName': instance.trackName,
      'createdDate': dateTimetoJson(instance.createdDate),
      'type': instance.type,
      'views': instance.views,
      'country': countryCodeToJson(instance.country),
      'latlng': latlngToJson(instance.latlng),
    };
