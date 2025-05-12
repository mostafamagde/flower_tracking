import 'package:flutter/material.dart';
import 'package:flower_tracking/core/app_colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        width: 380,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            buttonText,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.backgroundColor),
          ),
        ),
      ),
    );
  }
}
