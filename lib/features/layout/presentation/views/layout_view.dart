import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigation_cubit/navigation_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final NavigationCubit cubit = NavigationCubit.get(context);
        final List<Widget> screens = [Home(), Orders(), Profile()];
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            elevation: 0,
            selectedLabelStyle: TextStyle(color: AppColors.primaryColor),

            currentIndex: state.index,
            onTap: (value) => cubit.selectTab(value),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: AppColors.primaryColor),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month, color: Colors.grey),
                activeIcon: Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryColor,
                ),
                label: 'Result',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.grey),
                activeIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.primaryColor,
                ),
                label: 'Profile',
              ),
            ],
            // selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.grey.shade100,
            type: BottomNavigationBarType.fixed,
          ),
          body: screens[state.index],
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home"));
  }
}

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Orders"));
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}
