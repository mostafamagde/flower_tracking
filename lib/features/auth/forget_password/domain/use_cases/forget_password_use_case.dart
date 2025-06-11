
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
   final ForgetPasswordRepo _repo;
  ForgetPasswordUseCase(this._repo);

  Future<Result<ForgetPasswordEntity>> call(String email) async {
    return await _repo.forgetPassword(email);
  }
}