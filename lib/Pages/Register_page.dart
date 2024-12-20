import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_11pplg1_14/Pages/login_page.dart';
import 'package:pas1_11pplg1_14/Widget/mybutton.dart';
import 'package:pas1_11pplg1_14/Widget/mycolors.dart';
import 'package:pas1_11pplg1_14/Widget/mytextfield.dart';
import 'package:pas1_11pplg1_14/api_service.dart';
import 'package:pas1_11pplg1_14/controllers/login_controller.dart';
import 'package:pas1_11pplg1_14/models/login_model.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final LoginController authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Great to have you here!',
          style: TextStyle(fontWeight: FontWeight.bold, color: colortextW),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: colorheader,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_soccer_rounded, size: 150),
            SizedBox(height: 30),
            MyTextfield(
              labelText: "User",
              onChanged: (value) => authController.username.value = value,
            ),
            SizedBox(height: 20),
            Obx(
              () => MyTextfield(
                labelText: "Password",
                onChanged: (value) => authController.password.value = value,
                isPassword: true,
                isObscure: authController.isobscure.value,
                toggleVisibility: () {
                  authController.isobscure.value =
                      !authController.isobscure.value;
                },
              ),
            ),
            SizedBox(height: 20),
            MyTextfield(
              labelText: "Email",
              onChanged: (value) => authController.email.value = value,
            ),
            SizedBox(height: 20),
            MyTextfield(
              labelText: "Full name",
              onChanged: (value) => authController.full_name.value = value,
            ),
            SizedBox(height: 20),
            Expanded(child: Container()),
            MyButton(
              text: "Register",
              onclick: () async {
                RegisterModel user = RegisterModel(
                  username: authController.username.value,
                  password: authController.password.value,
                  email: authController.email.value,
                  full_name: authController.full_name.value,
                );

                // Call the login method from ApiService
                try {
                  Apiservice apiService = Apiservice();
                  ResponseModel response = await apiService.Register(user);

                  String message = response.message;
                  Get.snackbar(message, response.token);
                  authController.logged.value = response.status;
                  authController.login();
                } catch (e) {
                  Get.snackbar('Error', 'Failed to login: $e');
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                authController.isobscure.value = true;
                authController.username.value = '';
                authController.password.value = '';
                authController.email.value = '';
                authController.full_name.value = '';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors
                      .blue, // Optional: Change text color for a clickable look
                  decoration:
                      TextDecoration.underline, // Optional: Add underline
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
