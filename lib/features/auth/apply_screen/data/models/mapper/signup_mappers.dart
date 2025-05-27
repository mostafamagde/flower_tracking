import 'package:flower_tracking/features/auth/apply_screen/data/models/request/apply_request_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/request/apply_request_entity.dart';
import 'package:flower_tracking/features/auth/apply_screen/domain/entities/response/apply_response_entity.dart';

class SignupMappers {
  // Response Mappings
  static ApplyResponseEntity toEntity(ApplyResponseDto model) {
    return ApplyResponseEntity(
      message: model.message ?? "",
      token: model.token ?? "",
      driver: model.driver != null ? ApplyResponseEntityDriver(
        country: model.driver?.country ?? "",
        firstName: model.driver?.firstName ?? "",
        lastName: model.driver?.lastName ?? "",
        vehicleType: model.driver?.vehicleType ?? "",
        vehicleNumber: model.driver?.vehicleNumber ?? "",
        vehicleLicense: model.driver?.vehicleLicense ?? "",
        email: model.driver?.email ?? "",
        phone: model.driver?.phone ?? "",
        nID: model.driver?.nID ?? "",
        nIDImg: model.driver?.nIDImg ?? "",
        gender: model.driver?.gender ?? "",
        photo: model.driver?.photo ?? "",
        id: model.driver?.id ?? "",
        createdAt: model.driver?.createdAt ?? "",
      ) : null,
    );
  }

  static ApplyResponseDto toModel(ApplyResponseEntity entity) {
    return ApplyResponseDto(
      message:entity.message ?? "",
       token:  entity.token ?? "" ,
      driver: entity.driver != null ? ApplyResponseDtoDriver(

        country: entity.driver?.country ?? "",
        firstName: entity.driver?.firstName ?? "",
        lastName: entity.driver?.lastName ?? "",
        vehicleType: entity.driver?.vehicleType ?? "",
        vehicleNumber: entity.driver?.vehicleNumber ?? "",
        vehicleLicense: entity.driver?.vehicleLicense ?? "",
        email: entity.driver?.email ?? "",
        phone: entity.driver?.phone ?? "",
        nID: entity.driver?.nID ?? "",
        nIDImg: entity.driver?.nIDImg ?? "",
        gender: entity.driver?.gender ?? "",
        photo: entity.driver?.photo ?? "",
        id: entity.driver?.id ?? "",
        createdAt: entity.driver?.createdAt ?? "",
       ) : null,

    );
  }

  // Request: Entity -> Model
  static ApplyRequestDto toModelRequest(ApplyRequestEntity entity) {
    return ApplyRequestDto(
      country: entity.country ,
      firstName: entity.firstName ,
      lastName: entity.lastName ,
      vehicleType: entity.vehicleType,
      vehicleNumber: entity.vehicleNumber ,
      vehicleLicense: entity.vehicleLicense ,
      email: entity.email ,
      phone: entity.phoneNumber ,
      nID: entity.nID ,
      nIDImg: entity.nIDImg ,
      password: entity.password ,
      rePassword: entity.rePassword ,
      gender: entity.gender ,
    );
  }

  // Request: Model -> Entity
  static ApplyRequestEntity toEntityRequest(ApplyRequestDto model) {
    return ApplyRequestEntity(
      country: model.country ?? "",
      firstName: model.firstName ?? "",
      lastName: model.lastName ?? "",
      vehicleType: model.vehicleType ?? "",
      vehicleNumber: model.vehicleNumber ?? "",
      vehicleLicense: model.vehicleLicense ?? "",
      email: model.email ?? "",
      phoneNumber: model.phone ?? "",
      nID: model.nID ?? "",
      nIDImg: model.nIDImg ?? "",
      password: model.password ?? "",
      rePassword: model.rePassword ?? "",
      gender: model.gender ?? "",
    );
  }
}
