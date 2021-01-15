import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'badge_model.g.dart';

@CopyWith()
@JsonSerializable(nullable: true, explicitToJson: true)
class BadgeModel {
  String id;
  String name;
  String color1;
  String color2;
  String color3;
  String color4;

  BadgeModel({
    this.id,
    this.name,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> data) =>
      _$BadgeModelFromJson(data);

  Map<String, dynamic> toJson() => _$BadgeModelToJson(this);

  @override
  String toString() => 'BadgeModel{name: $name id: $id }';
}
