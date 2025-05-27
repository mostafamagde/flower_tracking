part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final Status forgetState;
  final String? forgetError;
  final ForgetPasswordEntity? forgetEntity;

  const ForgetPasswordState({
    this.forgetState = Status.loading,
    this.forgetEntity,
    this.forgetError,
  });

  ForgetPasswordState copyWith({
    Status? forgetState,
    String? forgetError,
    ForgetPasswordEntity? forgetEntity,
    ResetPasswordEntity? resetEntity,
    VerifyCodeEntity? verifyEntity,
  }) {
    return ForgetPasswordState(
      forgetState: forgetState ?? this.forgetState,
      forgetError: forgetError ?? this.forgetError,
      forgetEntity: forgetEntity ?? this.forgetEntity,
    );
  }
}
