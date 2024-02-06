// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:onestopservices/models/address/address.dart';
import 'package:onestopservices/models/phone/phone.dart';

part 'customer_create.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerCreate {
  int? status;
  String? name;
  String? email;
  String? username;
  String? password;
  Address? address;
  Phone? phone;
  String? avatar;

  CustomerCreate({
    this.status,
    this.name,
    this.email,
    this.username,
    this.password,
    this.address,
    this.phone,
    this.avatar,
  });

  factory CustomerCreate.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreateFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerCreateToJson(this);
}
