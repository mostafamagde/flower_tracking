import 'package:flower_tracking/core/di/di.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/cubit/apply_screen_cubit.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/pages/contant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ApplyScreenCubit>(),
      child: BlocConsumer<ApplyScreenCubit, ApplyScreenState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.pushNamed(context, '/doneScreen');
          } else if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'An error occurred.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ApplyScreenCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text('Apply Screen')),
            body: ContantScreen()
          );
        },
      ),
    );
  }
}
