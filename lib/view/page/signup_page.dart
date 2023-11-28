import 'package:first_project/controller/signup_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SingupController> {
  const SignupPage({super.key});
  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.black,
        elevation: 0,
        title: Text(
          '회원가입',
          style: AppTextStyle.koPtRegular16(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/logo.jpeg',
                      height: MediaQuery.of(context).size.height / 6,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '이름',
                      style: AppTextStyle.koPtRegular16(),
                    ),
                    AppTextfield(
                      hint: '이름을 입력해주세요',
                      controller: controller.nameController,
                    ),
                    Text(
                      '이메일',
                      style: AppTextStyle.koPtRegular16(),
                    ),
                    Obx(
                      () => AppTextfield(
                        hint: '이메일을 입력해주세요',
                        controller: controller.emailController,
                        error: controller.emailError.value,
                        onChanged: (value) => controller.checkEmail(value),
                        errorStyle: const TextStyle(color: AppColor.red),
                      ),
                    ),
                    Text(
                      '비밀번호',
                      style: AppTextStyle.koPtRegular16(),
                    ),
                    Obx(
                      () => AppTextfield(
                        hint: '비밀번호를 입력해주세요(8자리 이상 영문 숫자 혼합)',
                        controller: controller.pwController,
                        error: controller.pwError.value,
                        obscureText: true,
                        onChanged: (value) => controller.checkPassword(value),
                        errorStyle: const TextStyle(color: AppColor.red),
                      ),
                    ),
                    Text(
                      '비밀번호 확인',
                      style: AppTextStyle.koPtRegular16(),
                    ),
                    Obx(
                      () => AppTextfield(
                        hint: '비밀번호를 한번 더 입력해주세요',
                        controller: controller.pwConfirmController,
                        error: controller.pwConfirmError.value,
                        obscureText: true,
                        onChanged: (value) =>
                            controller.checkConfirmPassword(value),
                        errorStyle: const TextStyle(color: AppColor.red),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        child: AppButton(
                            name: '인증',
                            style: AppTextStyle.koPtRegular16white(),
                            onPressed: () {
                              controller.registerWithEmailAndPassword();
                            },
                            color: AppColor.black),
                      ),
                    )
                  ],
                ),
                AppButton(
                    name: '회원가입',
                    style: AppTextStyle.koPtRegular16white(),
                    onPressed: () async {
                      if (controller.isEmailverify.value == true) {
                        var result = await controller.register();
                        if (result) {
                          Get.offNamed(LoginPage.route);
                        }
                      } else {
                        Get.snackbar('이메일 인증 오류', '이메일 인증을 완료해주세요.');
                      }
                    },
                    // onpressed: () => Get.offNamed(LoginPage.route),
                    color: AppColor.black)
              ],
            ),
          )
        ]),
      )),
    );
  }
}
