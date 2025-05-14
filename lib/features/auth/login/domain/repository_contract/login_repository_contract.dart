import 'package:flower_tracking/core/models/result.dart';

import '../entity/login_request_entity.dart';
import '../entity/login_response_entity.dart';

abstract class LoginRepositoryContract {
  Future<Result<LoginResponseEntity>> login(LoginRequestEntity request);
}