part of 'verify_code_cubit.dart';

class VerifyCodeState {
  final Status verifyState;
  final Status forgetState;
  final String? verifyError;
  final VerifyCodeEntity? verifyEntity;
  final ForgetPasswordEntity? forgetEntity;

  const VerifyCodeState({
     this.verifyState = Status.initial,
     this.forgetState = Status.initial,
    this.verifyError,
    this.verifyEntity,
    this.forgetEntity,
  });

  VerifyCodeState copyWith({
    Status? verifyState,
    Status? forgetState,
    String? verifyError,
    VerifyCodeEntity? verifyEntity,
    ForgetPasswordEntity? forgetEntity,
  }) {
    return VerifyCodeState(
      verifyState: verifyState ?? this.verifyState,
      forgetState: forgetState ?? this.forgetState,
      verifyError: verifyError ?? this.verifyError,
      verifyEntity: verifyEntity ?? this.verifyEntity,
      forgetEntity: forgetEntity ?? this.forgetEntity,
    );
  }
}


