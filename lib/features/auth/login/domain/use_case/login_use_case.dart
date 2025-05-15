import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/login/domain/repository_contract/login_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../entity/login_request_entity.dart';
import '../entity/login_response_entity.dart';

@injectable
class LoginUseCase {
  final LoginRepositoryContract _loginRepositoryContract;

  LoginUseCase(this._loginRepositoryContract);

  Future<Result<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _loginRepositoryContract.login(request);
  }
}
