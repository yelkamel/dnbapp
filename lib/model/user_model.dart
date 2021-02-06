import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'user_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: true, explicitToJson: true)
class UserModel {
  String id;
  String level;
  String name;
  String pp;
  String email;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createdDate;
  int nbpost;
  int xp;
  List<String> tresor;
  List<String> postIds;
  String badgeId;

  UserModel({
    this.id,
    this.level,
    this.name,
    this.pp,
    this.email,
    this.badgeId,
    this.createdDate,
    this.nbpost = 0,
    this.xp = 0,
    this.tresor = const [],
    this.postIds = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() => 'UserModel{name: $name id: $id badgeId: $badgeId}';
}
