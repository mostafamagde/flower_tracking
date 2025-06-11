import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/verify_code/verify_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';

class InputNum extends StatelessWidget {
  const InputNum({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<VerifyCodeCubit>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return Expanded(
              child: Container(
                width: 74,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xffCFCFCF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: viewModel.isValid ? Colors.transparent : AppColors.error,
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: viewModel.controllers[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: const TextStyle(fontSize: 26),
                  cursorColor: AppColors.greyColor,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (value) {
                    if (value.length == 1) {
                      if (index < 5) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        final code = viewModel.controllers.map((e) => e.text).join();
                        viewModel.verifyCode(code);
                      }
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        if (!viewModel.isValid)
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Icon(Icons.info_outlined, color: AppColors.error, size: 12),
                const SizedBox(width: 2),
                Text(
                  'Invalid code',
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
