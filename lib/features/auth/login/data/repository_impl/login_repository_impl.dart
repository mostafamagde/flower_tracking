import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/login/data/data_source_contract/login_data_source_contract.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/login_request_entity.dart';
import '../../domain/entity/login_response_entity.dart';
import '../../domain/repository_contract/login_repository_contract.dart';

@Injectable(as: LoginRepositoryContract)
class LoginRepositoryImpl implements LoginRepositoryContract {
  final LoginDataSourceContract _loginDataSourceContract;

  @factoryMethod
  LoginRepositoryImpl(this._loginDataSourceContract);

  @override
  Future<Result<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    var result = await _loginDataSourceContract.login(request);
    return result;
  }
}