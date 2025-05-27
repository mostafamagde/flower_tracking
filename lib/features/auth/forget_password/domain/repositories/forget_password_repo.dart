import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';

import '../entities/reset_password_entity.dart';
import '../entities/verify_code_entity.dart';

abstract class ForgetPasswordRepo {
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email);

  Future<Result<VerifyCodeEntity>> verifyCode(String resetCode);

  Future<Result<ResetPasswordEntity>> restPassword(String email,newPassword);
}