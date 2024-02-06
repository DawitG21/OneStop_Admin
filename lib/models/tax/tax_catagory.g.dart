// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_catagory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxCatagory _$TaxCatagoryFromJson(Map<String, dynamic> json) => TaxCatagory(
      name: json['name'] as String?,
      rate: json['rate'] as String?,
      type: json['type'] as bool? ?? false,
    );

Map<String, dynamic> _$TaxCatagoryToJson(TaxCatagory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'rate': instance.rate,
    };
