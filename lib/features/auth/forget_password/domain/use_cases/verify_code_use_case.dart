import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  ForgetPasswordRepo repo;

  VerifyCodeUseCase({required this.repo});

  Future<Result<VerifyCodeEntity>> call(String resetCode) async{
    return await repo.verifyCode(resetCode);
  }
}
