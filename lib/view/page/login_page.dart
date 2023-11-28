import 'package:first_project/controller/login_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/widget/app_background.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Row(
                children: const [
                  AppBackGround(),
                  AppBackGround(),
                  AppBackGround(),
                  AppBackGround(),
                  AppBackGround(),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(right: 58, bottom: 38),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset('assets/images/background_logo.jpeg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(64, 64, 64, 0),
            child: Column(
              children: [
                AppTextfield(
                  hint: '이메일',
                  controller: controller.emailController,
                  onChanged: (_) => controller.activeButton(),
                ),
                AppTextfield(
                  hint: '비밀번호',
                  controller: controller.pwController,
                  obscureText: true,
                  onChanged: (_) => controller.activeButton(),
                ),
                Row(
                  children: [
                    Obx(
                      () => SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          value: controller.isAutoSignupOn.value,
                          shape: const CircleBorder(),
                          onChanged: (value) =>
                              controller.isAutoSignupOn.value = value ?? false,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text('자동로그인'),
                  ],
                ),
                const SizedBox(height: 16),
                Obx(
                  () => AppButton(
                    name: '로그인',
                    style: AppTextStyle.koPtRegular16white(),
                    onPressed: controller.isButtonActive.value
                        ? controller.login
                        : null,
                    color: AppColor.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Get.toNamed(FindPasswordPage.route),
                      child: const Text(
                        '비밀번호 찾기',
                        style: TextStyle(color: AppColor.black),
                      ),
                    ),
                    const Text('|'),
                    TextButton(
                      onPressed: () => Get.toNamed(SignupPage.route),
                      child: const Text(
                        '회원가입',
                        style: TextStyle(color: AppColor.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
