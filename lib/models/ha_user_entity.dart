/// run    flutter pub run build_runner build --delete-conflicting-outputs  in terminal
/// generate: ha_user_entity.g.dart
/// which has fromJson and toJson methods
/// they are _$HAUserEntityFromJson  and  _$HAUserEntityToJson
/// LAST:  we can use these two in this file
///
/// Generating code continuously
/// running flutter pub run build_runner watch --delete-conflicting-outputs in the project root
///
/// For Generating code for nested classes
/// use
/// @JsonSerializable(explicitToJson: true)

import 'package:json_annotation/json_annotation.dart';



part 'ha_user_entity.g.dart';

@JsonSerializable()
class HAUserEntity {
  HAUserEntity(
      {this.country,
      this.dob,
      this.email,
      this.firstName,
      this.lastName,
      this.imageUrl,
      this.mobileNumber,
      this.uid,
      this.id,
      this.notification,
      this.credits});

  String? country;
  String? dob;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  String? uid;
  String? id;
  bool? notification;
  double? credits;


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory HAUserEntity.fromJson(Map<String, dynamic> json) =>
      _$HAUserEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HAUserEntityToJson(this);
}
