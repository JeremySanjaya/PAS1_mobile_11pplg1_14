import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_11pplg1_14/Pages/dashboard_page.dart';
import 'package:pas1_11pplg1_14/Pages/login_page.dart';
import 'package:pas1_11pplg1_14/appBindings/appBindings.dart';
import 'package:pas1_11pplg1_14/controllers/login_controller.dart';

Future<void> main() async {
  final authController = Get.put(LoginController());
  bool loggedIn = await authController.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  const MyApp({super.key, required this.loggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Appbinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: loggedIn ? '/dashboard' : '/',
      getPages: [
        // list all pages here
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardPage(),
          binding: Appbinding(),
        ),
      ],
    );
  }
}
