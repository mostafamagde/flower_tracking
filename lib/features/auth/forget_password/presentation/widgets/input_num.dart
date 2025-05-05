import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';

class InputNum extends StatelessWidget {
   InputNum({super.key,required this.viewModel});

  ForgetPasswordCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              width: 74,
              height: 68,
              decoration: BoxDecoration(
                color: const Color(0xffCFCFCF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: viewModel.isValid ? Colors.transparent : AppColors.errorColor
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(

                cursorColor: AppColors.greyColor,
                style: const TextStyle(
                  fontSize: 26,
                ),
                controller: viewModel.controllers[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (value) {
                  if (value.length == 1 && index < 3) {
                    FocusScope.of(context)
                        .nextFocus(); // Move to next field
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context)
                        .previousFocus(); // Move to previous field
                  }
                },
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        if (!viewModel.isValid) // Show error message if the code is invalid
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.info_outlined,
                  color: AppColors.errorColor,
                  size: 12,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                    'Invalid code',
                    style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                        color: AppColors.errorColor
                    )
                ),
              ],
            ),
          ),
      ],
    );
  }
}
