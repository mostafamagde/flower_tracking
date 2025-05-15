// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyRequestDto _$ApplyRequestDtoFromJson(Map<String, dynamic> json) =>
    ApplyRequestDto(
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      nID: json['NID'] as String?,
      nIDImg: json['NIDImg'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$ApplyRequestDtoToJson(ApplyRequestDto instance) =>
    <String, dynamic>{
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'email': instance.email,
      'phone': instance.phone,
      'NID': instance.nID,
      'NIDImg': instance.nIDImg,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'gender': instance.gender,
    };
