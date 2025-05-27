
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepo repo;
  ResetPasswordUseCase({required this.repo});
  Future<Result<ResetPasswordEntity>> call(String email,newPassword)async{
    return await repo.restPassword(email,newPassword);
  }
}