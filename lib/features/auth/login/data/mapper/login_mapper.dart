import '../../domain/entity/login_request_entity.dart';
import '../../domain/entity/login_response_entity.dart';
import '../model/request/login_request_dto.dart';
import '../model/response/login_response_dto.dart';

class LoginMapper {
  static LoginRequestDto toDto(LoginRequestEntity request) {
    return LoginRequestDto(email: request.email, password: request.password);
  }

  static LoginResponseEntity toEntity(LoginResponseDto response) {
    return LoginResponseEntity(
        message: response.message, token: response.token);
  }
}