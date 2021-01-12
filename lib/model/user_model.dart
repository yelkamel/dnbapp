import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'user_model.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false, explicitToJson: true)
class UserModel extends Equatable {
  final String id;
  final String level;
  final String name;
  final String pp;
  final String email;
  final String badge;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  final DateTime createdDate;
  final int nbpost;
  final int xp;
  final List<String> tresor;
  final List<String> postIds;

  UserModel({
    this.id,
    this.level,
    this.name,
    this.pp,
    this.email,
    this.badge,
    this.createdDate,
    this.nbpost = 0,
    this.xp = 0,
    this.tresor = const [],
    this.postIds = const [],
  });

  @override
  List<Object> get props => [id, name, badge];

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() => 'UserModel{name: $name id: $id badge: $badge}';
}
