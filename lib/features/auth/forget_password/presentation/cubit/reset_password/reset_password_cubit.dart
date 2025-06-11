import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/result.dart';
import '../../../../../../core/utils/status.dart';
import '../../../domain/entities/reset_password_entity.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetUseCase})
    : super(const ResetPasswordState());

  final ResetPasswordUseCase resetUseCase;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  Future<void> resetPassword(String email, password) async {
    emit(state.copyWith(resetState: Status.loading));
    Result<ResetPasswordEntity> result = await resetUseCase.call(
      email,
      password,
    );

    switch (result) {
      case Success<ResetPasswordEntity>():
        emit(
          state.copyWith(resetState: Status.success, resetEntity: result.data),
        );
      case Error<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetState: Status.error,
            resetError: result.exception.toString(),
          ),
        );
    }
  }
}
