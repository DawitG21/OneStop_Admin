// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'storage.g.dart';

@JsonSerializable()
class Storage {
  dynamic file;

  Storage({
    this.file,
  });

  factory Storage.fromJson(Map<String, dynamic> json) =>
      _$StorageFromJson(json);
  Map<String, dynamic> toJson() => _$StorageToJson(this);
}
