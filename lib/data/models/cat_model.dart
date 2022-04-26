import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class Cat {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: '__v')
  int? v;
  String? text;
  String? createdAt;
  String? updatedAt;
  bool? deleted;
  String? source;
  int? sentCount;

  Cat({
    this.id,
    this.v,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.source,
    this.sentCount,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}
