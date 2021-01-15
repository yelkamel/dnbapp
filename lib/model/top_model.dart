import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'top_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: false, explicitToJson: true)
class TopModel {
  String id;
  String uid;
  UserModel user;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime updatedDate;
  List<PostModel> posts;

  TopModel({this.id, this.uid, this.user, this.posts, this.updatedDate});

  factory TopModel.fromJson(Map<String, dynamic> data) =>
      _$TopModelFromJson(data);

  Map<String, dynamic> toJson() => _$TopModelToJson(this);

  @override
  String toString() => 'TopModel{ posts: $posts badge: $updatedDate}';
}
