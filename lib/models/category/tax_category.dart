import 'package:json_annotation/json_annotation.dart';

part 'tax_category.g.dart';

@JsonSerializable(explicitToJson: true)
class TaxCategoryUpdate {
  String? name;
  bool type;
  String? rate;

  TaxCategoryUpdate({
    this.name,
    this.rate,
    required this.type,
  });
  factory TaxCategoryUpdate.fromJson(Map<String, dynamic> json) =>
      _$TaxCategoryUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$TaxCategoryUpdateToJson(this);
}
