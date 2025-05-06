import 'package:flower_tracking/core/api_manager/api_execute.dart';
import 'package:flower_tracking/core/api_manager/api_manager.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/data/data_sources/contract/forget_password_data_source_contract.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  RestClient apiClient;
  ForgetPasswordDataSourceImpl({required this.apiClient});
  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email) async{
    return ApiExecute.executeApi<ForgetPasswordEntity>(() async{
      return await apiClient.forgetPassword(email);
    },);
  }

}