import 'package:bloc/bloc.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/verify_code_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/result.dart';
import '../../../../../../core/utils/status.dart';
import '../../../domain/entities/forget_password_entity.dart';
import '../../../domain/use_cases/verify_code_use_case.dart';

part 'verify_code_state.dart';

@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit({
    required this.verifyCodeUseCase,
    required this.forgetPasswordUseCase,

    @Named('resetCode') required this.resetCode,
  }) : super(VerifyCodeState());

  final VerifyCodeUseCase verifyCodeUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  TextEditingController emailController = TextEditingController();
  bool isValid = true;
  final String resetCode;

  Future<void> verifyCode(String resetCode) async {
    emit(state.copyWith(verifyState: Status.loading));
    final result = await verifyCodeUseCase.call(resetCode);

    switch (result) {
      case Success<VerifyCodeEntity>():
        emit(
          state.copyWith(
            verifyState: Status.success,
            verifyEntity: result.data,
          ),
        );
      case Error<VerifyCodeEntity>():
        emit(
          state.copyWith(
            verifyState: Status.error,
            verifyError: result.exception.toString(),
          ),
        );
    }
  }

  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(forgetState: Status.loading));
    Result<ForgetPasswordEntity> result = await forgetPasswordUseCase.call(
      email,
    );
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
            // forgetError: result.exception.toString(),
          ),
        );
    }
  }
}
