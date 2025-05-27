class ApplyRequestEntity {
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String email;
  final String phoneNumber;
  final String nID;
  final String nIDImg;

  final String password;
  final String rePassword;
  final String gender;

  ApplyRequestEntity({
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.email,
    required this.phoneNumber,
    required this.nID,
    required this.nIDImg,

    required this.password,
    required this.rePassword,
    required this.gender,
  });
}
