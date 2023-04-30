///  run    flutter pub run build_runner build --delete-conflicting-outputs  in terminal
/// generate: ha_error_entity.g.dart
/// which has fromJson and toJson methods
import 'package:json_annotation/json_annotation.dart';

part 'ha_error_entity.g.dart';

@JsonSerializable()
class HAErrorEntity {
  List<String>? errors;
  HAErrorEntity(this.errors);
  factory HAErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$HAErrorEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HAErrorEntityToJson(this);
}
