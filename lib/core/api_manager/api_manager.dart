import 'package:dio/dio.dart';
import 'package:flower_tracking/features/auth/forget_password/data/models/forget_password_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/api/v1/drivers/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST('forgotPassword')
  Future<ForgetPasswordDto> forgetPassword(String email);
}
