import 'package:bloc/bloc.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/core/utils/status.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetUseCase})
    : super(const ForgetPasswordState());

  final ForgetPasswordUseCase forgetUseCase;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(forgetState: Status.loading));
    Result<ForgetPasswordEntity> result = await forgetUseCase.call(email);

    switch (result) {
      case Success<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            forgetState: Status.success,
            forgetEntity: result.data,
          ),
        );
      case Error<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            forgetState: Status.error,
            forgetError: result.exception.toString(),
          ),
        );
    }
  }
}
