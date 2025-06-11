import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';

import '../../../domain/entities/reset_password_entity.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email);

  Future<Result<VerifyCodeEntity>> verifyCode(String code);

  Future<Result<ResetPasswordEntity>> restPassword(String email, newPassword);
}