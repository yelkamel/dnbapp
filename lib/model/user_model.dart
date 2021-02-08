import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dnbapp/model/post_model.dart';

import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'user_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: true, explicitToJson: true)
class UserModel {
  String id;
  String name;
  String email;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createdDate;
  List<String> saved;
  List<String> posts;
  String badgeId;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.badgeId,
    this.createdDate,
    this.saved = const [],
    this.posts = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() => 'UserModel{name: $name id: $id badgeId: $badgeId}';

  int get nbOfPost => posts.length;
  int get nbOfSaved => saved.length;
}
