// ignore_for_file: non_constant_identifier_names

// Project imports:
import 'package:onestopservices/models/activity/activity.dart';
import 'package:onestopservices/models/address/address.dart';
import 'package:onestopservices/models/deviceInfo/device_info.dart';
import 'package:onestopservices/models/location/location.dart';
import 'package:onestopservices/models/phone/phone.dart';
import 'package:onestopservices/models/verificationCode/verification_code.dart';

// Package imports:
import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable(explicitToJson: true)
class Customer {
  String? id;
  Phone? phone;
  Activity? activity;
  Address? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? username;
  
  String? customerNumber;
  String? role;
  String? email;
  int? status;
  String? name;
  // String? password;
  String? avatar;
  String? otp; //
  DeviceInformation? device_info; //
  List<VerificationCode>? verification_code; //
  List<dynamic>? refer_history; //
  List<dynamic>? addressList; //
  List<Location>? geo; //

  Customer({
    this.id,
    this.phone,
    this.activity,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.username,
    this.customerNumber,
    this.role,
    this.email,
    this.status,
    this.name,
    // this.password,
    this.avatar,
    this.otp, //
    this.device_info, //
    this.verification_code, //
    this.refer_history, //
    this.addressList, //
    this.geo, //
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
