import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  final count = 0.obs;

  var isChecked = true.obs;

  var isPasswordVisible = false.obs;

  var userNameController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoForget() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void increment() => count.value++;
}
