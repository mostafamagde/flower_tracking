part of 'reset_password_cubit.dart';

class ResetPasswordState {
  final Status resetState;
  final String? resetError;
  final ResetPasswordEntity? resetEntity;

  const ResetPasswordState({
    this.resetState = Status.initial,
    this.resetError,
    this.resetEntity,
  });

  ResetPasswordState copyWith({
    Status? resetState,
    String? resetError,
    ResetPasswordEntity? resetEntity,
  }) {
    return ResetPasswordState(
      resetState: resetState ?? this.resetState,
      resetError: resetError ?? this.resetError,
      resetEntity: resetEntity ?? this.resetEntity,
    );
  }
}
