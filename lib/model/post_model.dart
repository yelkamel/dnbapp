import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'post_model.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false, explicitToJson: true)
class PostModel extends Equatable {
  final String id;
  final String name;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  final DateTime createdDate;
  final UserModel user;
  final String type;
  final int views;

  PostModel({
    this.id,
    this.name,
    this.createdDate,
    this.user,
    this.type,
    this.views,
  });

  @override
  List<Object> get props => [id, name, createdDate];

  factory PostModel.fromJson(Map<String, dynamic> data) =>
      _$PostModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  String toString() => 'PostModel{name: $name id: $id badge: $createdDate}';
}
