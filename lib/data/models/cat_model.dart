import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Cat {
  @HiveField(0)
  @JsonKey(name: '_id')
  String? id;
  @HiveField(1)
  @JsonKey(name: '__v')
  int? v;
  @HiveField(2)
  String? text;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  DateTime? updatedAt;
  @HiveField(5)
  bool? deleted;
  @HiveField(6)
  String? source;
  @HiveField(7)
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
