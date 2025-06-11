import 'package:flutter/material.dart';

import '../../../../../core/app_theme/app_theme.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,required this.topText,required this.text});
   String topText,text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          topText,
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          text,
          style: AppTheme.lightTheme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
