// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'witness.g.dart';

@JsonSerializable(explicitToJson: true)
class Witness {
  String? nationalId;
  String? name;
  String? phone;
  String? document;
  // String? id;

  Witness({
    this.nationalId,
    this.name,
    this.phone,
    this.document,
    // this.id,
  });

  factory Witness.fromJson(Map<String, dynamic> json) =>
      _$WitnessFromJson(json);
  Map<String, dynamic> toJson() => _$WitnessToJson(this);
}
