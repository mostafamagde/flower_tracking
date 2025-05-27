part of 'apply_screen_cubit.dart';

enum Status { initial, loading, success, error }

class ApplyScreenState extends Equatable {
  final Status status;
  final String? errorMessage;
  final String? successMessage;

  const ApplyScreenState({
    this.status = Status.initial,
    this.errorMessage,
    this.successMessage,
  });

  ApplyScreenState copyWith({
    Status? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return ApplyScreenState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage ?? '', successMessage ?? ''];
}
