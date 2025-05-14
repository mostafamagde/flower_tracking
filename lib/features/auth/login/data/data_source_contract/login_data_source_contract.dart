
import '../../../../../core/models/result.dart';
import '../../domain/entity/login_request_entity.dart';
import '../../domain/entity/login_response_entity.dart';

abstract class LoginDataSourceContract {
  Future<Result<LoginResponseEntity>> login(LoginRequestEntity request);
}

