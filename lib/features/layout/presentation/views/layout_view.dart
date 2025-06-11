import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
   LayoutView({super.key});
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
   final List<Widget> screens = [Home(), Orders(), Profile()];
  @override
  Widget build(BuildContext context) {


        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, index, child) {
              return BottomNavigationBar(
                currentIndex: index,
                onTap: (newIndex) => _selectedIndex.value = newIndex,
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
              );
            },
          ),
          body: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, index, child) {
              return screens[index];
            },
          ),
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
/* return Scaffold(
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
        );*/