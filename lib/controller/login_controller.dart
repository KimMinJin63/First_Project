import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final Rxn<User> _user = Rxn();
  RxBool isAutoSignupOn = false.obs;
  User? get user => _user.value;

  RxBool isButtonActive = false.obs;

  // login() async {
  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //         email: emailController.text, password: pwController.text);

  //     if (userCredential.user != null) {
  //       Get.offAllNamed(MainPage.route);
  //     } else {
  //       // 로그인 실패 처리
  //       //...
  //     }
  //   } catch (e) {
  //     Get.snackbar('로그인 실패', '잘못된 비밀번호입니다. 다시 시도해주세요',
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: const Duration(milliseconds: 3000),
  //         backgroundColor: AppColor.black,
  //         colorText: AppColor.white);
  //   }
  // }
  login() async {
    if (await Get.find<AuthController>()
        .login(emailController.text, pwController.text, isAutoSignupOn.value)) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isAutoSigningOn', isAutoSignupOn.value);
      Get.offAllNamed(MainPage.route);
    } else {
      Get.snackbar('로그인 실패', '잘못된 비밀번호입니다. 다시 시도해주세요',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          backgroundColor: AppColor.black,
          colorText: AppColor.white);
    }
  }

  activeButton() {
    if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }
}
