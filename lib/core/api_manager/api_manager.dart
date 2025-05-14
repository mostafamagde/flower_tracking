import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/auth/login/data/model/request/login_request_dto.dart';
import '../../features/auth/login/data/model/response/login_response_dto.dart';
import 'api_constant.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/api/v1/drivers/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST(ApiConstants.signInApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);
}
