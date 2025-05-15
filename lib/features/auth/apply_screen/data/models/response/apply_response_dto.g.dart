// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyResponseDto _$ApplyResponseDtoFromJson(Map<String, dynamic> json) =>
    ApplyResponseDto(
      message: json['message'] as String?,
      driver:
          json['driver'] == null
              ? null
              : ApplyResponseDtoDriver.fromJson(
                json['driver'] as Map<String, dynamic>,
              ),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ApplyResponseDtoToJson(ApplyResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
      'token': instance.token,
    };

ApplyResponseDtoDriver _$ApplyResponseDtoDriverFromJson(
  Map<String, dynamic> json,
) => ApplyResponseDtoDriver(
  country: json['country'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  vehicleType: json['vehicleType'] as String?,
  vehicleNumber: json['vehicleNumber'] as String?,
  vehicleLicense: json['vehicleLicense'] as String?,
  nID: json['NID'] as String?,
  nIDImg: json['NIDImg'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  id: json['_id'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ApplyResponseDtoDriverToJson(
  ApplyResponseDtoDriver instance,
) => <String, dynamic>{
  'country': instance.country,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'vehicleType': instance.vehicleType,
  'vehicleNumber': instance.vehicleNumber,
  'vehicleLicense': instance.vehicleLicense,
  'NID': instance.nID,
  'NIDImg': instance.nIDImg,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  '_id': instance.id,
  'createdAt': instance.createdAt,
};
