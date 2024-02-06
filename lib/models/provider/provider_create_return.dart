// Package imports:
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:onestopservices/models/dob/dob.dart';
import 'package:onestopservices/models/phone/phone.dart';
import 'package:onestopservices/models/profileDetails/profile.dart';
import 'package:onestopservices/models/provider/skillattachments.dart';

part 'provider_create_return.g.dart';

@JsonSerializable(explicitToJson: true)
class ProviderCreateReturn {
  String? id;
  String? name;
  String? username;
  String? gender;
  BirthDate? birthdate;
  String? email;
  Phone? phone;
  String? avatar;
  String? password;
  List<ProfileDetails>? profile_details; 
  String? availability_address;
  String? experience;
  int? status;
  int? taskerStatus;
  String? taskerNumber;
  List<Skillattachments>? attachments;
  String? createdBy;

  ProviderCreateReturn({
    this.username,
    this.gender,
    this.birthdate,
    this.email,
    this.phone,
    this.avatar,
    this.password,
    this.profile_details,
    this.name,
    this.experience,
    this.status,
    this.attachments,
    this.taskerStatus,
    this.createdBy,  
    this.availability_address, 
  });

  factory ProviderCreateReturn.fromJson(Map<String, dynamic> json) =>
      _$ProviderCreateReturnFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderCreateReturnToJson(this);
}
