// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'witness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Witness _$WitnessFromJson(Map<String, dynamic> json) => Witness(
      nationalId: json['nationalId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      document: json['document'] as String?,
      // id: json['id'] as String?,
    );

Map<String, dynamic> _$WitnessToJson(Witness instance) => <String, dynamic>{
      'nationalId': instance.nationalId,
      'name': instance.name,
      'phone': instance.phone,
      'document': instance.document,
      // 'id': instance.id,
    };
