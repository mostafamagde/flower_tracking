import 'package:json_annotation/json_annotation.dart';

part 'apply_request_dto.g.dart';

@JsonSerializable()
class ApplyRequestDto {
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  @JsonKey(name: 'vehicleLicense')
  final String? vehicleLicense;
  final String? email;
  final String? phone;
  @JsonKey(name: 'NID')
  final String? nID;
  @JsonKey(name: 'NIDImg')
  final String? nIDImg;

  final String? password;
  final String? rePassword;
  final String? gender;


  ApplyRequestDto({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.email,
    this.phone,
    this.nID,
    this.nIDImg,
    this.password,
    this.rePassword,
    this.gender,
  });

  factory ApplyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyRequestDtoToJson(this);
}
