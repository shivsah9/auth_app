import 'package:auth_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: Get.height,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.red.withOpacity(0.1)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 107,
                    width: 107,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Log in',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )),
                TextFormField(
                  controller: controller.userNameController,
                  decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () {
                            controller.isPasswordVisible.value =
                                !controller.isPasswordVisible.value;
                          },
                          child: Icon(controller.isPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value ?? false;

                          print(controller.isChecked);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Remember me'),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD, arguments: [
                          controller.userNameController.text,
                          controller.passwordController.text
                        ]);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      print(controller.passwordController.text);
                      print(controller.userNameController.text);
                    },
                    child: Text("Log in"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
