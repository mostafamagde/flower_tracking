import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  bool isLoading = false;

  Future<void> _handleLoginPress() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      Navigator.pushNamed(context, '/loginScreenTest');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/check-circle.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 20),
                Text(
                  'Your application has been\n submitted!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Text(
                  'Thank you for providing your application,\n we will review your application and will \nget back to you soon.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 15),
                isLoading
                    ?  CircularProgressIndicator(color:    AppColors.primaryColor)
                    : CustomButton(
                  onPressed: _handleLoginPress,
                  buttonText: 'Login',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
