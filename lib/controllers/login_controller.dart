import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/registration.dart';
import '../main.dart';
import '../screens/homescreen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  var obscurePassword = true.obs;
  var isLoading = false.obs;


  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }


  Future <void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      await setUsername();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> setUsername() async {
    String name = emailController.text.split('@')[0];
    userName = name[0].toUpperCase() + name.substring(1);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", userName);


    Get.off(() => HomeScreen()); // Use Get.off to replace current screen
  }


  void goToRegistration() {
    Get.to(() => Registration()); // Use Get.to for normal navigation
  }

  // Clean up controllers when controller is disposed
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}