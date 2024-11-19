import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_11pplg1_14/Menus/favorite_menu.dart';
import 'package:pas1_11pplg1_14/Menus/profile_menu.dart';
import 'package:pas1_11pplg1_14/Menus/teams_menu.dart';
import 'package:pas1_11pplg1_14/controllers/Dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());

    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [TeamsMenu(), FavoriteMenu(), ProfileMenu()];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          return Scaffold(
            body: menus[dashboardController.selectedIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: dashboardController.selectedIndex.value,
              onTap: dashboardController.changeMenu,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_soccer_outlined), label: "Teams"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined), label: "Profile"),
              ],
            ),
          );
        });
      },
    );
  }
}
