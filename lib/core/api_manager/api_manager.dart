import 'package:dio/dio.dart';
import 'package:flower_tracking/features/auth/forget_password/data/models/forget_password_dto.dart';
import 'package:flower_tracking/features/auth/forget_password/data/models/reset_password_dto.dart';
import 'package:flower_tracking/features/auth/forget_password/data/models/verify_code_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/api/v1/drivers/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST('forgotPassword')
  Future<ForgetPasswordDto> forgetPassword(@Body() Map<String, dynamic> email);

  @POST('verifyResetCode')
  Future<VerifyCodeDto> verifyCode(@Body() Map<String, dynamic> body);

  @PUT('resetPassword')
  Future<ResetPasswordDto> resetPassword(@Body() Map<String, dynamic> body);


}
