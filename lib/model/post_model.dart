import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import '../utils.dart';

part 'post_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: false, explicitToJson: true)
class PostModel {
  String id;
  String uid;
  String name;
  String producer;
  String trackName;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createdDate;
  String type;
  int views;
  @JsonKey(toJson: countryCodeToJson, fromJson: countryCodeFromJson)
  CountryCode country;

  PostModel({
    this.id,
    this.uid,
    this.name,
    this.createdDate,
    this.type,
    this.views,
    this.country,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) =>
      _$PostModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  String toString() => 'PostModel{name: $name id: $id badge: $createdDate}';
}
