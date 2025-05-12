import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flower_tracking/core/api_manager/api_constant.dart';
import 'package:flower_tracking/features/auth/apply_screen/data/models/response/apply_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST(ApiConstant.applyDriver)
  @MultiPart()
  @MultiPart()
  @POST(ApiConstant.applyDriver)
  Future<ApplyResponseDto> applyDriver(
      @Part(name: "country") String country,
      @Part(name: "firstName") String firstName,
      @Part(name: "lastName") String lastName,
      @Part(name: "vehicleType") String vehicleType,
      @Part(name: "vehicleNumber") String vehicleNumber,
      @Part(name: 'vehicleLicense',contentType: "image/jpeg")  File vehicleLicense,
      @Part(name: "email") String email,
      @Part(name: "phone") String phone,
      @Part(name: "NID") String nid,
      @Part(name: 'NIDImg',contentType: "image/jpeg")  File nIDImg,
      @Part(name: "password") String password,
      @Part(name: "rePassword") String rePassword,
      @Part(name: "gender") String gender,
      );

}
