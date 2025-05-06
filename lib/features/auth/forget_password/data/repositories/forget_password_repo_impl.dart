import 'package:dio/dio.dart';
import 'package:flower_tracking/core/exceptions/exceptions_impl.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/data/data_sources/contract/forget_password_data_source_contract.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordDataSourceContract dataSource;

  ForgetPasswordRepoImpl({required this.dataSource});

  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email) async {
    try {
      return await dataSource.forgetPassword(email);
    } on DioException catch (ex){
      return Error(NetworkError(ex.message));
    }
  }
}