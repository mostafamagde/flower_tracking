import 'package:flower_tracking/core/api_manager/api_execute.dart';
import 'package:flower_tracking/core/api_manager/api_manager.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/data/data_sources/contract/forget_password_data_source_contract.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  final RestClient _apiClient;
  ForgetPasswordDataSourceImpl({required RestClient apiClient}) : _apiClient = apiClient;
  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email) async{
    return ApiExecute.executeApi<ForgetPasswordEntity>(() async{
      return await _apiClient.forgetPassword({"email": email});
    },);
  }

  @override
  Future<Result<ResetPasswordEntity>> restPassword(String email, newPassword) async {
    return ApiExecute.executeApi<ResetPasswordEntity>(() async {
      return await _apiClient.resetPassword({
        "email": email,
        "newPassword": newPassword,
      });
    });
  }

  @override
  Future<Result<VerifyCodeEntity>> verifyCode(String code) async {
    return ApiExecute.executeApi<VerifyCodeEntity>(() async {
      return await _apiClient.verifyCode({"resetCode": code});
    },);
  }

}