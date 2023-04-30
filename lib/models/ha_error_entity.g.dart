// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HAErrorEntity _$HAErrorEntityFromJson(Map<String, dynamic> json) =>
    HAErrorEntity(
      (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HAErrorEntityToJson(HAErrorEntity instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
