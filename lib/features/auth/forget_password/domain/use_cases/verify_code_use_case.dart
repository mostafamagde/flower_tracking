import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
 final ForgetPasswordRepo _repo;

  VerifyCodeUseCase( this._repo);

  Future<Result<VerifyCodeEntity>> call(String resetCode) async{
    return await _repo.verifyCode(resetCode);
  }
}
