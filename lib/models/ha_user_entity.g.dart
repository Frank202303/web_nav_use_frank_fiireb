// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HAUserEntity _$HAUserEntityFromJson(Map<String, dynamic> json) => HAUserEntity(
      country: json['country'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      imageUrl: json['image_url'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      uid: json['uid'] as String?,
      id: json['id'] as String?,
      notification: json['notification'] as bool?,
      credits: (json['credits'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HAUserEntityToJson(HAUserEntity instance) =>
    <String, dynamic>{
      'country': instance.country,
      'dob': instance.dob,
      'email': instance.email,
      'first_name': instance.firstName,
      'image_url': instance.imageUrl,
      'last_name': instance.lastName,
      'mobile_number': instance.mobileNumber,
      'uid': instance.uid,
      'id': instance.id,
      'notification': instance.notification,
      'credits': instance.credits,
    };
