// ignore_for_file: non_constant_identifier_names

// Project imports:
import 'package:onestopservices/models/activity/activity.dart';
import 'package:onestopservices/models/address/address.dart';
import 'package:onestopservices/models/dob/dob.dart';
import 'package:onestopservices/models/experience/experience.dart';
import 'package:onestopservices/models/location/location.dart';
import 'package:onestopservices/models/phone/phone.dart';
import 'package:onestopservices/models/profileDetails/profile.dart';
import 'package:onestopservices/models/provider/skillattachments.dart';
import 'package:onestopservices/models/verificationCode/verification_code.dart';

// Package imports:
import 'package:json_annotation/json_annotation.dart';
part 'provider.g.dart';

@JsonSerializable(explicitToJson: true)
class ServiceProvider {
  String? id;
  BirthDate? birthdate;
  Phone? phone;
  Activity? activity;
  int? radius;
  DateTime? createdAt;
  String? createdBy;
  String? taskerNumber;
  String? username;
  String? gender;
  String? email;
  String? role;
  String? avatar;
  String? availability_address;
  Experience? experience;
  List<Skillattachments>? skillattachments;
  List<ProfileDetails>? profile_details;
  int? taskerStatus;
  int? status;
  String? name;
  List<VerificationCode>? verification_code;
  DateTime? updatedAt;
  String? password;
  //BELOW NOT NEEDED
  Location? location;
  Address? address;
  String? nationalId;
 

  ServiceProvider({
    this.id,
    this.status,
    this.taskerStatus,
    this.radius,
    this.updatedAt,
    this.createdAt,
    this.role,
    this.gender,
    this.avatar,
    this.username,
    this.email,
    this.name,
    this.password,
    this.availability_address,
    this.address,
    this.activity,
    this.phone,
    this.location,
    this.birthdate,
    this.experience,
    this.nationalId,
    this.profile_details,
    this.verification_code,
 
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceProviderToJson(this);
}
