
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
   ForgetPasswordRepo repo;
  ForgetPasswordUseCase({required this.repo});
  Future<Result<ForgetPasswordEntity>> call(String email){
    return repo.forgetPassword(email);
  }
}