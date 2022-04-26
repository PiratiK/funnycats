// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      id: json['_id'] as String?,
      v: json['__v'] as int?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deleted: json['deleted'] as bool?,
      source: json['source'] as String?,
      sentCount: json['sentCount'] as int?,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.v,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
      'source': instance.source,
      'sentCount': instance.sentCount,
    };
