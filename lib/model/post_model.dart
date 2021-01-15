import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'post_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: false, explicitToJson: true)
class PostModel {
  String id;
  String name;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createdDate;
  UserModel user;
  String type;
  int views;

  PostModel({
    this.id,
    this.name,
    this.createdDate,
    this.user,
    this.type,
    this.views,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) =>
      _$PostModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  String toString() => 'PostModel{name: $name id: $id badge: $createdDate}';
}
